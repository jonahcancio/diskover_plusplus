<template>
  <div id="map" :style="{height: height}">
    <v-progress-circular :indeterminate="true"></v-progress-circular>
  </div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin";

export default {
  mixins: [MapMixin],
  props: {
    defaultFormCoords: {
      type: Array,
      default() {
        return this.$defaultStartCoords;
      }
    },
    readonly: {
      type: Boolean,
      default: false
    }
  },
  watch: {
    defaultFormCoords() {
      this.resetMapView();
    },
    readonly() {
      this.handleReadOnly();
    }
  },
  mounted() {
    this.resetMapView();
    this.handleReadOnly();
    console.log("form-click based on readonly initialized");
    this.$eventBus.$on("reset-map-view", this.resetMapView);
  },
  methods: {
    handleReadOnly() {
      console.log("handling readonly: ", this.readonly);
      if (this.readonly) {
        this.map.off("click", this.setMarkerToClick);
      } else {
        this.map.on("click", this.setMarkerToClick);
      }
    },
    setMarkerToClick(e) {
      this.removeAllMarkers();
      let { lat, lng } = e.latlng;
      this.addMarker(e.latlng, {draggable: false});
      this.$emit("click", [lat, lng]);
    },
    //Override
    resetMapView() {
      this.map.setView(this.defaultFormCoords, 15);
      this.removeAllMarkers();
      this.addMarker(this.defaultFormCoords);
    }
  },
  destroyed() {
    this.$eventBus.$off("reset-map-view", this.resetMapView);
  }
};
</script>

<style scoped>
</style>
