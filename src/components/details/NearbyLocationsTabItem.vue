<template>
  <!-- Tab item for displaying nearby locations to the current location -->
  <v-card color="secondary">
    <!-- only display if nearby locations are found -->
    <v-list v-if="nearbyLocations && nearbyLocations.length">
      <!-- add hyperlinks to nearby locations that navigate to their details page onclick -->
      <v-list-tile
        v-for="near in nearbyLocations"
        :key="near.id"
        :to="`/map/details/${near.id}`"
        @click="{}"
      >
        <v-list-tile-content>
          <v-list-tile-title>{{ near.name }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
    <!-- display indicator of no nearby locations are found -->
    <v-container v-else>
      <span class="body-2">No nearby locations found</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  computed: {
    // reference nearbyLocations from the Vuex store
    nearbyLocations() {
      return this.$store.state.details.nearbyLocations;
    }
  }
};
</script>

<style>
</style>
