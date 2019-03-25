<template>
  <!-- the default map page -->
  <div>
    <!-- renders side drawer on left side -->
    <SideDrawer :height="mapExactHeight">
      <router-view></router-view>
    </SideDrawer>
    <!-- render the huge map on the rest of the screen -->
    <v-layout :style="{height: mapExactHeight}">      
      <v-flex xs-12>
        <BigMapView height="100%" :isOnDetailsPage="isOnDetailsPage">
          <FloatingButton attachedTo="map"/>
        </BigMapView>
      </v-flex>
    </v-layout>   
  </div>
</template>

<script>
export default {
  computed: {
    // calculate the exact height the map needs to be; subtracts the navbar height
    mapExactHeight() {
      return this.$vuetify.breakpoint.mdAndUp
        ? "calc(100vh - 64px)"
        : "calc(100vh - 48px)";
    },
    // returns search or details depending on route 
    mapMode() {
      return this.$route.name;
    },
    // returns true if on details page
    isOnDetailsPage() {
      return this.$route.name == "details";
    }
  },
  watch: {
    // always set sidedrawer as visible whenver route changes but page stays on map
    $route(to) {
      this.$store.commit("setSideDrawer", true);
    }
  },
};
</script>

<style scoped>
</style>

