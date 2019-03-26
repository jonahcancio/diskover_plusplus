<template>
  <!-- Basic Navbar with important links -->
  <v-toolbar color="primary" app id="nav-bar">
    <!-- Left Side -->
    <v-toolbar-items>
      <!-- Homepage link -->
      <v-btn to="/" class="white--text" flat>Diskover++</v-btn>
      <!-- Button for displaying GPS configuration modals -->
      <v-btn class="white--text" flat @click="openGpsModal">Configure GPS</v-btn>

      <!-- Create new location link -->
      <!-- <v-btn to="/form/create" class="white--text" flat>New Location</v-btn> -->
    </v-toolbar-items>
    <v-spacer></v-spacer>

    <!-- Right Side -->
    <!-- Desktop Version -->
    <v-toolbar-items v-if="$vuetify.breakpoint.mdAndUp">
      <!-- Map link -->
      <v-btn to="/map" flat class="white--text" @click="showFullMap">
        <span class="white--text">MAP</span>
      </v-btn>
      <!-- FAQs link -->
      <v-btn to="/faq" flat class="white--text">
        <span class="white--text">HELP</span>
      </v-btn>
    </v-toolbar-items>

    <!-- Mobile Version -->
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
          <!-- Map link -->
          <v-list-tile @click="{}" active-class="primary-text list-active">            
            <router-link to="/map">
              <v-list-tile-title class="white--text" @click="showFullMap">MAP</v-list-tile-title>
            </router-link>
          </v-list-tile>
          <!-- FAQs link -->
          <v-list-tile @click="{}" active-class="primary-text list-active">
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
  methods: {
    // tuck sideDrawer In to show full map
    showFullMap() {
      this.$store.commit("setSideDrawer", false)
    },
    // trigger event for gps modals to react to and open
    openGpsModal() {
      this.$eventBus.$emit("open-gps-bottom-modal")
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

.list-active {
  color: white !important;
  background-color: var(--v-primary-lighten1) !important;
}

#nav-bar {
  z-index: 1001 !important;
  padding-left: 0px !important;
}
</style>
