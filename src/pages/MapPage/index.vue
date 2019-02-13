<template>
  <div>
    <SideDrawer :height="mapExactHeight">
      <router-view></router-view>
    </SideDrawer>
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
  data() {
    return {
      isBottomModalVisible: !this.$store.state.isGpsPermissionToMark,
      isCenterModalVisible: false
    };
  },
  computed: {
    mapExactHeight() {
      return this.$vuetify.breakpoint.mdAndUp
        ? "calc(100vh - 64px)"
        : "calc(100vh - 48px)";
    },
    mapMode() {
      return this.$route.name;
    },
    isOnDetailsPage() {
      return this.$route.name == "details";
    }
  },
  watch: {
    $route(to) {
      this.$store.commit("setSideDrawer", true);
    }
  },
  methods: {

  }
};
</script>

<style scoped>
</style>

