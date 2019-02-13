<template>
  <div id="map" :style="{height: height}">
    <slot></slot>
    <v-layout justify-center align-center>
      <v-flex align-center>
        <v-progress-circular :indeterminate="true"></v-progress-circular>
      </v-flex>
    </v-layout>
  </div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin";

export default {
  mixins: [MapMixin],
  props: {
    isOnDetailsPage: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      gpsButton: null,
      currentCoords: this.$defaultStartCoords,
      pendingCoords: this.$defaultStartCoords,
      boundingBox: L.latLngBounds(this.$defaultUpBoundingBox),
      // hasPermissionToMark: false,
      routing: null
    };
  },
  computed: {
    endCoords() {
      return this.$store.state.details.endCoords;
    },
    routeCoordinates() {
      return this.$store.state.details.routeCoordinates;
    },
    hasPermissionToMark: {
      get() {
        return this.$store.state.isGpsPermissionToMark;
      },
      set(value) {
        this.$store.commit("setGpsPermissionToMark", value);
      }
    }
  },
  mounted() {
    this.initGeolocation();
    console.log("geolocation event callbacks initialized");
    this.initGpsButton();
    console.log("gps button initialized");
    this.$eventBus.$on("permission-to-mark", this.grantPermissionToMark);
    console.log("permisson-to-mark callback initialized");
    this.initResetButton();
    console.log("reset button initialized");
    this.$eventBus.$on("call-geolocation", this.callGeolocation);
    if (this.isOnDetailsPage) {
      this.initRouting(this.currentCoords, this.endCoords);
      console.log("routing initialized");
    } else {
      this.addMarker(
        this.currentCoords,
        {
          draggable: true,
          icon: this.originIcon
        },
        "You are here. Drag me all you like."
      );
    }
    this.initInstructionCircles();
  },
  watch: {
    isOnDetailsPage() {
      this.removeAllMarkers();
      if (this.isOnDetailsPage) {
        this.initRouting(this.currentCoords, this.endCoords);
        console.log("routing initialized");
      } else {
        this.routing.remove();
        this.removeAllCircles();
        this.addMarker(
          this.currentCoords,
          {
            draggable: true,
            icon: this.originIcon
          },
          "You are here. Drag me all you like."
        );
      }
    },
    currentCoords() {
      this.removeAllMarkers();
      if (this.isOnDetailsPage) {
        this.routing.setWaypoints([
          L.latLng(this.currentCoords),
          L.latLng(this.endCoords)
        ]);
        console.log("currentCoords rerouted");
        this.map.fitBounds([this.currentCoords, this.endCoords]);
      } else {
        this.addMarker(
          this.currentCoords,
          {
            draggable: true,
            icon: this.originIcon
          },
          "You are here. Drag me all you like."
        );
        console.log("currentCoords remarkered");
        this.map.setView(this.currentCoords, 15);
      }
    },
    endCoords() {
      this.routing.setWaypoints([
        L.latLng(this.currentCoords),
        L.latLng(this.endCoords)
      ]);
      this.map.fitBounds([this.currentCoords, this.endCoords]);
    }
  },
  methods: {
    initGeolocation() {
      this.map.on("locationfound", e => {
        let { lat, lng } = e.latlng;
        this.pendingCoords = [lat, lng];
        if (this.hasPermissionToMark) {
          this.currentCoords = this.pendingCoords;
        } else if (this.boundingBox.contains(this.pendingCoords)) {
          this.grantPermissionToMark();
        } else {
          this.$eventBus.$emit("open-gps-center-modal");
        }
        console.log("geolocation pendingCoords found", this.pendingCoords);
      });
      this.map.on("locationerror", e => {
        console.log("geolocation error: ", e.message);
      });
    },
    initGpsButton() {
      this.gpsButton = L.easyButton({
        position: "bottomright",
        states: [
          {
            icon: '<i class="material-icons">gps_fixed</i>',
            onClick: () => {
              if (this.hasPermissionToMark) {
                this.map.locate({
                  enableHighAccuracy: true
                });
              } else {
                this.$eventBus.$emit("open-gps-bottom-modal");
              }
            }
          }
        ]
      }).addTo(this.map);
    },
    callGeolocation() {
      this.map.locate({
        enableHighAccuracy: true
      });
      console.log("geolocation called");
    },
    grantPermissionToMark() {
      this.hasPermissionToMark = true;
      this.currentCoords = this.pendingCoords;
      console.log("permission to mark granted");
    },
    initRouting(start, finish) {
      this.routing = L.Routing.control({
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
      this.routing.on("routesfound", e => {
        let insts = e.routes[0].instructions.map(inst => ({
          text: inst.text,
          distance: inst.distance,
          index: inst.index
        }));
        this.setInstructions(insts);
        let instIndex = 0;
        let coords = e.routes[0].coordinates.filter((coord, index) => {
          if (insts[instIndex].index == index) {
            instIndex++;
            return true;
          }
          return false;
        });
        this.setRouteCoordinates(coords);
        console.log("Routing Success!!! Found: ", e.routes[0]);
      });
      this.routing.on("routingerror", e => {
        console.log("Routing Error: ", e.error.message);
        this.setInstructions([]);
      });
    },
    initInstructionCircles() {
      this.$eventBus.$on("add-circle", index => {
        let coords = this.routeCoordinates[index];
        this.addCircle(coords, {
          radius: 15,
          color: "#03f",
          fillColor: "white",
          opacity: 1,
          fillOpacity: 0.7
        });
        this.map.setView(coords, 16);
      });
      this.$eventBus.$on("clear-circles", this.removeAllCircles);
    },
    setInstructions(instructions) {
      this.$store.commit("details/setInstructions", instructions);
    },
    setRouteCoordinates(coordinates) {
      this.$store.commit("details/setRouteCoordinates", coordinates);
    }
  }
};
</script>

<style scoped>
</style>
