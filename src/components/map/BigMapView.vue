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
import JeepMixin from "@/mixins/JeepMixin";

export default {
  // import the map mixin for automatic map initialization on #map
  mixins: [MapMixin, JeepMixin],
  // called after MapMixin's mounted method
  mounted() {
    // initialize GPS reset button on map
    this.initGpsButton();
    // initialize map reset button on map
    this.initResetButton();
    // intialize either search or details page
    this.handleMapChange();
    // initialize insturction circle to be triggered when instructions are clicked on the details page
    this.listenForInstructionCirlces();
  },
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
      routing: null,
      endIcon: null
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
    },
    resultIds() {
      return this.$store.getters["search/resultIds"];
    },
    resultCoords() {
      return this.$store.getters["search/resultCoords"];
    },
    fullIconUrls(state) {
      return this.$store.getters["search/fullIconUrls"];
    },
    detailIconUrl(state) {
      return this.$store.getters["details/fullIconUrl"];
    }
  },
  watch: {
    // changes map back from detail mode back to results mode or vice versa page change detected
    isOnDetailsPage() {
      this.handleMapChange();
    },
    // resets the origin marker whenever originCoords change detected
    originCoords() {
      this.handleMapChange();
    },
    // reset routing parameters when end coords change detected
    endCoords() {
      this.handleMapChange();
    },
    resultCoords() {
      this.handleMapChange();
    }
  },
  methods: {
    handleMapChange() {
      if (this.isOnDetailsPage) {
        this.initDetailsPageMap();
      } else {
        this.initSearchPageMap();
      }
    },
    initSearchPageMap() {
      if (this.routing) {
        this.routing.remove();
      }
      this.removeAllCircles();
      this.removeAllMarkers();
      // add origin marker
      this.addMarker(
        this.originCoords,
        {
          draggable: true,
          icon: this.originIcon
        },
        "You are here. Drag me all you like."
      );
      this.map.setView(this.originCoords, 15);
      // add result markers
      for (let i = 0; i < this.resultCoords.length; i++) {
        let icon = this.getIcon(this.fullIconUrls[i]);
        this.addMarker(this.resultCoords[i], {
          draggable: false,
          ...(icon && { icon: icon })
        }).on("click", () => {
          this.$router.push({
            name: "details",
            params: { id: this.resultIds[i] }
          });
        });
      }
    },
    initDetailsPageMap() {
      this.removeAllMarkers();
      if (this.routing) {
        this.routing.remove();
      }
      this.initRouting(this.originCoords, this.endCoords);
      this.map.fitBounds([this.originCoords, this.endCoords]);
    },
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
        serviceUrl: "https://diskover.up.edu.ph/osrm/route/v1",
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
              let icon = this.getIcon(this.detailIconUrl);
              return L.marker(waypoint.latLng, {
                draggable: false,
                ...(icon && { icon: icon })
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
        console.log(error.message);
        // reset instructions in Vuex store
        this.setInstructions([]);
      });
    },
    // initialize group to store instruction circles on
    listenForInstructionCirlces() {
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
