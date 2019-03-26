<template>
  <!-- clickable map for inputting latitude longitude data in a form -->
  <div id="map" :style="{height: height}">
    <!-- progress bar for when map takes a while to render -->
    <v-progress-circular :indeterminate="true"></v-progress-circular>
  </div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin";

export default {
  // implement MapMixin for easy map initialization at #map
  mixins: [MapMixin],
  props: {
    // the default Coordinates shown by the map potion of the form
    defaultFormCoords: {
      type: Array,
      default() {
        return this.$defaultStartCoords;
      }
    },
    // checks if form should only be read not written on
    readonly: {
      type: Boolean,
      default: false
    }
  },
  watch: {
    // reset map view wheenever the defaultForm Coordiantes have been reset
    defaultFormCoords() {
      this.resetMapView();
    },
    readonly() {
      // handle readOnly change
      this.handleReadOnly();
    }
  },
  // called when map is ready for rendinering
  mounted() {
    // reset the map and handle read Only changes
    this.resetMapView();
    this.handleReadOnly();
    // bind resetMapView function to trigger upon every reset-map-view event
    this.$eventBus.$on("reset-map-view", this.resetMapView);
  },
  methods: {
    handleReadOnly() {      
      if (this.readonly) {
        // readonly means click listeners should be off
        this.map.off("click", this.setMarkerToClick);
      } else {
        // non-readonly means click listeres should be on to change the map
        this.map.on("click", this.setMarkerToClick);
      }
    },
    // runs whenever map is clicked at point e.latlng; moves marker to that position
    setMarkerToClick(e) {
      this.removeAllMarkers();
      let { lat, lng } = e.latlng;
      this.addMarker(e.latlng, {draggable: false});
      this.$emit("click", [lat, lng]);
    },
    //Override reset mapview from mixin to a different zoom but back to UP Oble as always
    resetMapView() {
      this.map.setView(this.defaultFormCoords, 15);
      this.removeAllMarkers();
      this.addMarker(this.defaultFormCoords);
    }
  },
  destroyed() {
    // remove reset-map-view event listers when form map is destroyed
    this.$eventBus.$off("reset-map-view", this.resetMapView);
  }
};
</script>

<style scoped>
</style>
