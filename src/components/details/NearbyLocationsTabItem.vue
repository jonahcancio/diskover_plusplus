<template>
  <v-card color="secondary">
    <v-list v-if="nearbyLocations && nearbyLocations.length">
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
    <v-container v-else>
      <span class="body-2">No nearby locations found</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  computed: {
    nearbyLocations() {
      return this.$store.state.details.nearbyLocations;
    }
  }
};
</script>

<style>
</style>
