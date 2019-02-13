<template>
  <div>
    <BottomModal :isVisible="isBottomModalVisible" @close="setBottomModal(false)">
      <v-layout column align-center class="red lighten-4">
        <div class="display-1 pt-3">{{ gpsQuestionText }}</div>
        <v-layout>
          <v-btn color="blue" dark @click="callGeolocation">Yes</v-btn>
          <v-btn color="red" dark @click="forfeitPermissionToMark">No</v-btn>
        </v-layout>
      </v-layout>
    </BottomModal>
    <div id="hidden-map" :style="{display: 'none'}"></div>
    <CenterModal :isVisible="isCenterModalVisible" @close="setCenterModal(false)">
      <v-layout column align-content-space-around class="red lighten-4 text-xs-center">
        <v-flex
          class="headline amber lighten-4 py-3"
        >Your current location doesn't appear to be in UP Diliman</v-flex>
        <v-flex class="title pt-2">Continue GPS anyway?</v-flex>
        <v-layout justify-center>
          <v-btn color="blue" dark @click="grantPermissionToMark">Yes</v-btn>
          <v-btn color="red" dark @click="setCenterModal(false)">No</v-btn>
        </v-layout>
      </v-layout>
    </CenterModal>
  </div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin";

export default {
  mixins: [MapMixin],
  data() {
    return {
      isBottomModalVisible: !this.$store.state.isGpsPermissionToMark,
      isCenterModalVisible: false,
      pendingCoords: this.$defaultStartCoords,
      boundingBox: L.latLngBounds(this.$defaultUpBoundingBox)
    };
  },
  computed: {
    hasPermissionToMark: {
      get() {
        return this.$store.state.map.isGpsPermissionToMark;
      },
      set(value) {
        this.$store.commit("map/setGpsPermissionToMark", value);
      }
    },
    gpsQuestionText() {
      return this.hasPermissionToMark
        ? "Would you like to continue using GPS marker?"
        : "Would you like to use GPS to mark your location?";
    }
  },
  mounted() {
    this.initGeolocationCallbacks();
    this.$eventBus.$on("open-gps-bottom-modal", () => {
      this.setBottomModal(true);
    });
    this.$eventBus.$on("call-geolocation", this.callGeolocation);
  },
  methods: {
    setBottomModal(value) {
      this.isBottomModalVisible = value;
    },
    setCenterModal(value) {
      this.isCenterModalVisible = value;
    },
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
        console.log("geolocation pendingCoords found", this.pendingCoords);
      });
      this.map.on("locationerror", e => {
        console.log("geolocation error: ", e.message);
      });
    },
    callGeolocation() {
      this.setBottomModal(false);
      this.map.locate({
        enableHighAccuracy: true
      });
      console.log("geolocation called");
    },
    grantPermissionToMark() {
      this.setCenterModal(false);
      this.hasPermissionToMark = true;
      this.$store.commit("map/setOriginCoords", this.pendingCoords);
      console.log("permission to mark granted");
    },
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
