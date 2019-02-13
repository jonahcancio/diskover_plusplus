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
    <CenterModal :isVisible="isCenterModalVisible" @close="closeCenterModal">
      <v-layout column align-content-space-around class="red lighten-4 text-xs-center">
        <v-flex class="headline amber lighten-4 py-3">Your current location doesn't appear to be in UP Diliman</v-flex>
        <v-flex class="title pt-2">Continue GPS anyway?</v-flex>
        <v-layout justify-center>
          <v-btn color="blue" dark @click="grantPermissionToMark">Yes</v-btn>
          <v-btn color="red" dark @click="closeCenterModal">No</v-btn>
        </v-layout>
      </v-layout>
    </CenterModal>
    <BottomModal :isVisible="isBottomModalVisible" @close="closeBottomModal">
      <v-layout column align-center class="red lighten-4">
        <div class="display-1 pt-3">Would you like to use GPS to mark your location?</div>
        <v-layout>
          <v-btn color="blue" dark @click="callGeolocation">Yes</v-btn>
          <v-btn color="red" dark @click="closeBottomModal">No</v-btn>
        </v-layout>
      </v-layout>
    </BottomModal>
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
  mounted() {
    this.$eventBus.$on("open-gps-center-modal", this.openCenterModal);
    this.$eventBus.$on("open-gps-bottom-modal", this.openBottomModal);
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
    openBottomModal() {
      this.isBottomModalVisible = true;
    },
    closeBottomModal() {
      this.isBottomModalVisible = false;
    },
    callGeolocation() {
      this.$eventBus.$emit("call-geolocation");
      this.closeBottomModal();
    },
    openCenterModal() {
      this.isCenterModalVisible = true;
    },
    closeCenterModal() {
      this.isCenterModalVisible = false;
    },
    grantPermissionToMark() {
      this.$eventBus.$emit("permission-to-mark");
      this.closeCenterModal();
    }
  }
};
</script>

<style scoped>
</style>

