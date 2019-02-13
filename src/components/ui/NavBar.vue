<template>
  <v-toolbar color="primary" app id="nav-bar">
    <v-toolbar-items>
      <v-btn to="/" class="white--text" flat>Diskover++</v-btn>
      <v-btn to="/form/create" class="white--text" flat>New Location</v-btn>
    </v-toolbar-items>
    <v-spacer></v-spacer>

    <!--Desktop-->
    <v-toolbar-items v-if="$vuetify.breakpoint.mdAndUp">
      <v-btn to="/map" flat class="white--text" @click="showFullMap">
        <span class="white--text">MAP</span>
      </v-btn>
      <v-btn to="/faq" flat class="white--text">
        <span class="white--text">HELP</span>
      </v-btn>
    </v-toolbar-items>

    <!--Mobile-->
    <v-toolbar-items v-else>
      <v-menu
        attach="#nav-bar"
        bottom
        left
        offset-y
        min-width="300px"
        z-index="1003"
        :close-on-content-click="false"
      >
        <v-toolbar-side-icon dark slot="activator" id="nav-dropdown-activator"/>
        <v-list id="nav-dropdown">
          <v-list-tile>
            <router-link to="/map">
              <v-list-tile-title class="white--text" @click="showFullMap">MAP</v-list-tile-title>
            </router-link>
          </v-list-tile>
          <v-list-tile @click="{}">
            <router-link to="/faq">
              <v-list-tile-title class="white--text">HELP</v-list-tile-title>
            </router-link>
          </v-list-tile>
        </v-list>
      </v-menu>
    </v-toolbar-items>
  </v-toolbar>
</template>

<script>
export default {
  computed: {
    isOnMapRoute() {
      return (
        this.$route.name == "search" ||
        this.$route.name == "map" ||
        this.$route.name == "details"
      );
    }
  },
  methods: {
    showFullMap() {
      this.$store.commit("setSideDrawer", false)
    }
  }
};
</script>

<style>
* {
  font-family: roboto, sans-serif;
}

#nav-dropdown {
  background-color: var(--v-primary-base) !important;
}
/* 
.list-searchbar {
  min-height: 60px;
  display: flex;
  align-items: center;
} */

.list-active {
  color: white !important;
  background-color: var(--v-primary-lighten1);
}

#nav-bar {
  z-index: 1001 !important;
  padding-left: 0px !important;
}
</style>
