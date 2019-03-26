<template>
  <!-- GPS permission modals and hidden map for making GPS queries -->
  <div>
    <!-- Bottom modal for asking for GPS permission -->
    <BottomModal :isVisible="isBottomModalVisible" @close="setBottomModal(false)">
      <v-layout column align-center class="red lighten-4">
        <div class="display-1 pt-3">{{ gpsQuestionText }}</div>
        <v-layout>
          <!-- call for geolocation when Yes is clicked -->
          <v-btn color="blue" dark @click="callGeolocation">Yes</v-btn>
          <!-- forefeit geolocation permissions when No is clicked -->
          <v-btn color="red" dark @click="forfeitPermissionToMark">No</v-btn>
        </v-layout>
      </v-layout>
    </BottomModal>
    <!-- hidden GPS map -->
    <div id="hidden-map" :style="{display: 'none'}"></div>
    <!-- Center modal for confirming GPS permission despite proximity from UP diliman -->
    <CenterModal :isVisible="isCenterModalVisible" @close="setCenterModal(false)">
      <v-layout column align-content-space-around class="red lighten-4 text-xs-center">
        <v-flex
          class="headline amber lighten-4 py-3"
        >Your current location doesn't appear to be in UP Diliman</v-flex>
        <v-flex class="title pt-2">Continue GPS anyway?</v-flex>
        <v-layout justify-center>
          <!-- confirm geolocation marking permissions when Yes is clicked -->
          <v-btn color="blue" dark @click="grantPermissionToMark">Yes</v-btn>
          <!-- abstain from granting geolocation marking permissions if No is clicked -->
          <v-btn color="red" dark @click="setCenterModal(false)">No</v-btn>
        </v-layout>
      </v-layout>
    </CenterModal>
  </div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin";

export default {
  // implement MapMixin for default map behavior
  mixins: [MapMixin],
  data() {
    return {
      // true if Bottom Modal should be visible
      isBottomModalVisible: !this.$store.state.isGpsPermissionToMark,
      // true if Center Modal should be visible
      isCenterModalVisible: false,
      // pendingCoordinates to mark map with if geolocation permissions were to be granted
      pendingCoords: this.$defaultStartCoords,
      // bounding box of UP Diliman, used to check if current GPS location is inside UP
      boundingBox: L.latLngBounds(this.$defaultUpBoundingBox)
    };
  },
  computed: {
    // reference GPS's permission to mark map from Vuex store
    hasPermissionToMark: {
      // get value from Vuex store
      get() {
        return this.$store.state.map.isGpsPermissionToMark;
      },
      // set value in Vuex store
      set(value) {
        this.$store.commit("map/setGpsPermissionToMark", value);
      }
    },
    // question to be asked by the bottom modal, depends on whether permission to mark has been granted
    gpsQuestionText() {
      return this.hasPermissionToMark
        ? "Would you like to continue using GPS marker?"
        : "Would you like to use GPS to mark your location?";
    }
  },
  // called when map is ready to be binded to hidden DOM element
  mounted() {
    // initialize callback functions that will run in case successful/unsuccessful geolocation results found
    this.initGeolocationCallbacks();
    // allow bottom modal open up whenever eventBus is triggered by an open-gps-bottom-modal event
    this.$eventBus.$on("open-gps-bottom-modal", () => {
      this.setBottomModal(true);
    });
    // allow GPS Geolocation to be called whenever eventBus triggers a call-geolocation event
    this.$eventBus.$on("call-geolocation", this.callGeolocation);
  },
  methods: {
    // set Bottom modal visibility
    setBottomModal(value) {
      this.isBottomModalVisible = value;
    },
    // set Center modal visibility
    setCenterModal(value) {
      this.isCenterModalVisible = value;
    },
    // initialize call back functions to respond to locationfound and location error events
    initGeolocationCallbacks() {
      this.map.on("locationfound", e => {
        let { lat, lng } = e.latlng;
        this.pendingCoords = [lat, lng];
        if (this.hasPermissionToMark) {
          this.$store.commit("map/setOriginCoords", this.pendingCoords);
        } else if (this.boundingBox.contains(this.pendingCoords)) {
          this.grantPermissionToMark();
        } else {
          this.setCenterModal(true);
        }
        console.log("geolocation pendingCoords found: ", this.pendingCoords);
      });
      this.map.on("locationerror", e => {
        console.log("geolocation error: ", e.message);
      });
    },
    // call GPS geolocation from the hidden map
    callGeolocation() {
      this.setBottomModal(false);
      this.map.locate({
        enableHighAccuracy: true
      });
    },
    // grant permission to set the originMarker of the Big Map View to the GPS coordinates found
    grantPermissionToMark() {
      this.setCenterModal(false);
      this.hasPermissionToMark = true;
      this.$store.commit("map/setOriginCoords", this.pendingCoords);
      console.log("permission to mark granted");
    },
    // remove permission to set originMarker coordinates to GPS position found
    forfeitPermissionToMark() {
      this.setBottomModal(false);
      this.hasPermissionToMark = false;
      this.$store.commit("map/setOriginCoords", this.$defaultStartCoords);
    }
  }
};
</script>

<style scoped>
</style>
