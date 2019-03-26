<template>
  <!-- Tab item for displaying the inside rooms or outer building of the current location -->
  <v-card color="secondary">
    <!-- Display rooms if current location has inside rooms -->
     <v-list v-if="insideRooms && insideRooms.length">
      <v-list-tile
        v-for="inside in insideRooms"
        :key="inside.id"
        :to="`/map/details/${inside.room_id}`"
        @click="{}"
      >
        <v-list-tile-content>
          <v-list-tile-title>{{ inside.room }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
    <!-- else Display outer building if current location has an outer building -->
    <v-list v-else-if="outerBuilding">
      <v-list-tile 
        :to="`/map/details/${outerBuilding.building_id}`"
        @click="{}"
      >
        <v-list-tile-content>{{ outerBuilding.building }}</v-list-tile-content>
      </v-list-tile>
    </v-list>
    <!-- else display indicator that no rooms/outer building found -->
    <v-container v-else>
      <span class="body-2">No Rooms Found</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  computed: {
    // reference inside rooms from Vuex store
    insideRooms() {
      return this.$store.state.details.insideRooms;
    },
    // reference outer building from Vuex store
    outerBuilding() {
      return this.$store.state.details.outerBuilding;
    }
  }
};
</script>

<style>
</style>
