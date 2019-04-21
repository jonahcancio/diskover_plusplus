<template>
  <!-- Tab item for displaying main building of the current location -->
  <v-card color="secondary">
    <!-- Display outer building if current location has an outer building -->
    <v-list v-if="building">
      <v-list-tile 
        :to="`/map/details/${building.id}`"
        @click="{}"
      >
        <v-list-tile-content>{{ building.name }}</v-list-tile-content>
      </v-list-tile>
    </v-list>
    <!-- else display indicator that no outer building found -->
    <v-container v-else>
      <span class="body-2">No Building Found</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  props: ['building'],
};
</script>

<style>
</style>
