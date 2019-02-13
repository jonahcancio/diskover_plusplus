<template>
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
  props: {
    attachedTo: {
      type: String,
      default: "map"
    }
  },
  data() {
    return {
      isVisible: true
    }
  },
  computed: {
    isSideDrawerVisible() {
      return this.$store.state.isSideDrawerVisible
    },
    isOnMap() {
      return this.attachedTo == "map"
    },
    checkSideDrawer() {
      if (this.isOnMap) {
        return !this.$store.state.isSideDrawerVisible
      }else {
        return this.$store.state.isSideDrawerVisible
      }
    },
    positioning() {
      return {
        left: this.isOnMap,
        right: !this.isOnMap
      } 
    },
    extraStyle() {
      let offset = this.$vuetify.breakpoint.mdAndUp? "-40px" : "320px"
      return {
        left: this.isOnMap? "auto": offset
      }
    },
    icon() {
      return this.isOnMap? "arrow_forward_ios" : "arrow_back_ios"
    }
  },
  methods: {
    toggleSideDrawer() {
      this.$eventBus.$emit("toggle-side-drawer")
    }
  }

};
</script>

<style scoped>
.floating-btn {
  z-index: 1002 !important;
  top: 60px;
}
</style>
