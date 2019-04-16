<template>
  <!-- Tab item for displaying the inside rooms or outer building of the current location -->
  <v-card color="secondary">
    <!-- Display rooms if current location has inside rooms -->
    <v-list v-if="subareas">
      <v-list-tile
        v-for="sub in subareas"
        :key="sub.id"
        :to="`/map/details/${sub.id}`"
        @click="{}"
      >
        <v-list-tile-content>
          <v-list-tile-title>{{ sub.name }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
    <v-container v-else>
      <span class="body-2">No {{ label }} Found</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      default: "subareas"
    },
    subareas: {
      required: true
    }
  },
};
</script>

<style>
</style>
