<template>
  <!-- the huge map displayed on the right side on the search and details pages -->
  <div id="map" :style="{height: height}">
    <slot></slot>
    <v-layout justify-center align-center>
      <v-flex align-center>
        <!-- loading circle in case map doesnt load in time -->
        <v-progress-circular :indeterminate="true"></v-progress-circular>
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin";

export default {
  // import the map mixin for automatic map initialization on #map
  mixins: [MapMixin],  
  props: {
    // prop to check if page is currently on details or still in results
    isOnDetailsPage: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      // stores  the button control for resetting map zoom to GPS location
      gpsButton: null,
      // stores object used for controlling the map routings
      routing: null
    };
  },
  computed: {
    // references the final destination coordinates from Vuex store
    endCoords() {
      return this.$store.state.details.endCoords;
    },
    // references the important route coordinate points from Vuex store
    routeCoordinates() {
      return this.$store.state.details.routeCoordinates;
    },
    // references permission for GPS to set marker of map from Vuex store
    hasPermissionToMark() {      
      return this.$store.state.map.isGpsPermissionToMark;
    },
    // references the origin start coordinates from Vuex store
    originCoords: {
      // reference Vuex store state
      get() {
        return this.$store.state.map.originCoords;
      },
      // allow setting of value in Vuex store
      set(value) {
        this.$store.commit("map/setOriginCoords", value);
      }
    }
  },
  // called after MapMixin's mounted method
  mounted() {
    // initialize GPS reset button on map
    this.initGpsButton();
    // initialize map reset button on map
    this.initResetButton();
    // add routing from origin coordinates to end coordinates if on detail page
    if (this.isOnDetailsPage) {
      this.initRouting(this.originCoords, this.endCoords);
      console.log("routing initialized");
    }
    // add a marker corresponding to origin coordinates if on results page
    else {
      this.addMarker(
        this.originCoords,
        {
          draggable: true,
          icon: this.originIcon
        },
        "You are here. Drag me all you like."
      );
    }
    // initialize insturction circle to be triggered when instructions are clicked on the details page
    this.initInstructionCircles();
  },
  watch: {
    // changes map back from detail mode back to results mode or vice versa page change detected
    isOnDetailsPage() {
      this.removeAllMarkers();
      if (this.isOnDetailsPage) {
        this.initRouting(this.originCoords, this.endCoords);
      } else {
        this.routing.remove();
        this.removeAllCircles();
        this.addMarker(
          this.originCoords,
          {
            draggable: true,
            icon: this.originIcon
          },
          "You are here. Drag me all you like."
        );
      }
    },
    // resets the origin marker whenever originCoords change detected
    originCoords() {
      // remove all origin markers
      this.removeAllMarkers();
      // add a routing control if on details page
      if (this.isOnDetailsPage) {
        this.routing.setWaypoints([
          L.latLng(this.originCoords),
          L.latLng(this.endCoords)
        ]);
        this.map.fitBounds([this.originCoords, this.endCoords]);
      } 
      // add an origin marker if on results page
      else {
        this.addMarker(
          this.originCoords,
          {
            draggable: true,
            icon: this.originIcon
          },
          "You are here. Drag me all you like."
        );
        this.map.setView(this.originCoords, 15);
      }
    },
    endCoords() {
      // reset routing parameters when end coords are changed and fit map zoom to bounding box of markers appropriately
      this.routing.setWaypoints([
        L.latLng(this.originCoords),
        L.latLng(this.endCoords)
      ]);
      this.map.fitBounds([this.originCoords, this.endCoords]);
    }
  },
  methods: {
    // initialize GPS button at the bottom right to dod different thiings based on permission to mark
    initGpsButton() {
      this.gpsButton = L.easyButton({
        position: "bottomright",
        states: [
          {
            icon: '<i class="material-icons">gps_fixed</i>',
            onClick: () => {
              if (this.hasPermissionToMark) {
                this.$eventBus.$emit("call-geolocation");
              } else {
                this.$eventBus.$emit("open-gps-bottom-modal");
              }
            }
          }
        ]
      }).addTo(this.map);
    },
    // initialize routing using personally Hosted OSRM at serviceUrl and connect start and finish coordinates together
    initRouting(start, finish) {
      this.routing = L.Routing.control({
        serviceUrl: 'https://diskover.up.edu.ph/osrm/route/v1',
        plan: L.Routing.plan([L.latLng(start), L.latLng(finish)], {
          createMarker: (index, waypoint) => {
            if (index == 0) {
              return L.marker(waypoint.latLng, {
                draggable: true,
                icon: this.originIcon
              })
                .bindPopup("You are here. Drag me all you like")
                .openPopup();
            } else {
              return L.marker(waypoint.latLng, {
                draggable: false
              })
                .bindPopup("You want to go here")
                .openPopup();
            }
          }
        }),
        routeWhileDragging: true,
        show: false,
        fitSelectedRoutes: true,
        collapsible: true
      }).addTo(this.map);
      // set the intsructions object in the Vuex store when routes haven been found
      this.routing.on("routesfound", e => {
        let insts = e.routes[0].instructions.map(inst => ({
          text: inst.text,
          distance: inst.distance,
          index: inst.index
        }));
        this.setInstructions(insts);
        // get the important coordinates in the calculated route (turns and corners)
        let instIndex = 0;        
        let coords = e.routes[0].coordinates.filter((coord, index) => {
          if (insts[instIndex].index == index) {
            instIndex++;
            return true;
          }
          return false;
        });
        // set Vuex store coordinates to the important coordinates
        this.setRouteCoordinates(coords);
      });
      // output a routing error whenever routing has failed
      this.routing.on("routingerror", e => {
        alert("OSRM Routing Error ");
        console.log(error.message)
        // reset instructions in Vuex store
        this.setInstructions([]);
      });
    },
    // initialize group to store instruction circles on
    initInstructionCircles() {
      this.$eventBus.$on("add-circle", index => {
        let coords = this.routeCoordinates[index];
        // styling the circle
        this.addCircle(coords, {
          radius: 15,
          color: "#03f",
          fillColor: "white",
          opacity: 1,
          fillOpacity: 0.7
        });
        this.map.setView(coords, 16);
      });
      // trigger to respond to clear-circles event by removing all the circles
      this.$eventBus.$on("clear-circles", this.removeAllCircles);
    },
    // set the instructions stored by the Vuex store
    setInstructions(instructions) {
      this.$store.commit("details/setInstructions", instructions);
    },
    // set the route coordinates stored by the Vuex store
    setRouteCoordinates(coordinates) {
      this.$store.commit("details/setRouteCoordinates", coordinates);
    }
  }
};
</script>

<style scoped>
</style>
