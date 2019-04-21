<template>
<!-- DESKTOP VERSIONS -->
  <v-menu
    v-if="isLoggedIn && $vuetify.breakpoint.mdAndUp"
    attach="#nav-bar"
    bottom
    left
    offset-y
    min-width="300px"
    z-index="1005"
  >
    <v-btn flat class="white--text" slot="activator">
      <span>Logged in as {{ loggedInUser }}</span>
    </v-btn>
    <v-list id="nav-admin-dropdown">
      <!-- create location link -->
      <v-list-tile :to="{name: 'location_crud_form', params: {mode: 'create'}}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Create new location</v-list-tile-title>
      </v-list-tile>
      <!-- upload images link -->
      <v-list-tile  :to="{name: 'upload_images_form'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Upload new images</v-list-tile-title>
      </v-list-tile>
      <!-- delete images link -->
      <v-list-tile :to="{name: 'delete_images_form'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Delete images</v-list-tile-title>
      </v-list-tile>
      <!-- browse categories link -->
      <v-list-tile :to="{name: 'categorytable'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Browse categories</v-list-tile-title>
      </v-list-tile>
      <!-- browse tags link -->
      <v-list-tile :to="{name: 'tagtable'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Browse tags</v-list-tile-title>
      </v-list-tile>
      <!-- Log out link -->
      <v-list-tile :to="{name: 'login'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Log out</v-list-tile-title>
      </v-list-tile>
    </v-list>
  </v-menu>
  <v-menu
    v-else-if="!isLoggedIn && $vuetify.breakpoint.mdAndUp"
    attach="#nav-bar"
    bottom
    left
    offset-y
    min-width="300px"
    z-index="1005"
  >
    <v-btn flat class="white--text" slot="activator">
      <span>Anonymous User</span>
    </v-btn>
    <v-list id="nav-admin-dropdown">
      <!-- Log in link -->
      <v-list-tile :to="{name: 'login'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Log in</v-list-tile-title>
      </v-list-tile>
    </v-list>
  </v-menu>

  <!-- MOBILE VERSIONS -->
  <v-menu
    v-else-if="isLoggedIn && !$vuetify.breakpoint.mdAndUp"
    attach="#nav-bar"
    min-width="300px"
    offset-x
    right
    z-index="1005"
  >
    <v-list-tile slot="activator" @click="{}" active-class="primary-text list-active" id="nav-admin-button">
      <v-list-tile-title class="white--text">
        <span>Logged in as {{ loggedInUser }}</span>
      </v-list-tile-title>
    </v-list-tile>
    <v-list id="nav-admin-dropdown">
      <!-- create location link -->
      <v-list-tile :to="{name: 'location_crud_form', params: {mode: 'create'}}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Create new location</v-list-tile-title>
      </v-list-tile>
      <!-- upload images link -->
      <v-list-tile  :to="{name: 'upload_images_form'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Upload new images</v-list-tile-title>
      </v-list-tile>
      <!-- delete images link -->
      <v-list-tile :to="{name: 'delete_images_form'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Delete images</v-list-tile-title>
      </v-list-tile>
      <!-- browse categories link -->
      <v-list-tile :to="{name: 'categorytable'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Browse categories</v-list-tile-title>
      </v-list-tile>
      <!-- browse tags link -->
      <v-list-tile :to="{name: 'tagtable'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Browse tags</v-list-tile-title>
      </v-list-tile>
      <!-- Log out link -->
      <v-list-tile :to="{name: 'login'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Log out</v-list-tile-title>
      </v-list-tile>
    </v-list>
  </v-menu>
  <v-menu
    v-else
    attach="#nav-bar"
    offset-x
    right
    min-width="300px"
    z-index="1005"
  >
    <v-list-tile slot="activator" @click="{}" active-class="primary-text list-active">
      <v-list-tile-title class="white--text">
        <span>Anonymous User</span>
      </v-list-tile-title>
    </v-list-tile>
    <v-list id="nav-admin-dropdown">
      <!-- Log in link -->
      <v-list-tile :to="{name: 'login'}" active-class="primary-text list-active">
        <v-list-tile-title class="white--text">Log in</v-list-tile-title>
      </v-list-tile>
    </v-list>
  </v-menu>
</template>

<script>
export default {
  computed: {
    isLoggedIn() {
      return this.$store.getters["auth/isLoggedIn"];
    },
    loggedInUser() {
      return this.$store.state.auth.user;
    }
  }
};
</script>

<style>
* {
  font-family: roboto, sans-serif;
}

#nav-admin-dropdown {
  background-color: var(--v-primary-base) !important;
}

</style>