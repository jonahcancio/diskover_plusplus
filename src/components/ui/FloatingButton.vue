<template>
  <!-- Floating Button used to control sideDrawer visibility -->
  <v-btn
    v-show="checkSideDrawer"
    absolute
    dark
    fab
    small
    :style="extraStyle"
    left
    color="primary"
    class="floating-btn"
    @click="toggleSideDrawer"
  >
    <v-icon>{{icon}}</v-icon>
  </v-btn>
</template>

<script>
export default {
  // lets parent component specify which component button is attached to
  props: {
    attachedTo: {
      type: String,
      default: "map"
    }
  },
  data() {
    return {
      // controls visibility of button
      isVisible: true
    }
  },
  computed: {
    // returns true if button is attached to the map
    isOnMap() {
      return this.attachedTo == "map"
    },
    // checks side drawer and attached to property and returns true if button should be visible
    checkSideDrawer() {
      if (this.isOnMap) {
        // only show map button ">" if sideDrawer is tucked in
        return !this.$store.state.isSideDrawerVisible
      }else {
        // only show drawer button "<" if sideDrawer is tucked out
        return this.$store.state.isSideDrawerVisible
      }
    },
    // control the button offset based on device width and where it's attached 
    extraStyle() {
      let offset = this.$vuetify.breakpoint.mdAndUp? "-40px" : "320px"
      return {
        left: this.isOnMap? "auto": offset
      }
    },
    // control button icon:
    // "<" if attached to drawer for tucking it in
    // ">" if attached to map for tucking drawer out
    icon() {
      return this.isOnMap? "arrow_forward_ios" : "arrow_back_ios"
    }
  },
  methods: {
    // use eventBus to trigger event for sideDrawer to react to whenever button is pressed
    toggleSideDrawer() {
      this.$eventBus.$emit("toggle-side-drawer")
    }
  }

};
</script>

<style scoped>
.floating-btn {
  /* Keep Button in front of Everything Else */
  z-index: 1002 !important;
  top: 60px;
}
</style>
