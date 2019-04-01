<template>
  <!-- Tab item for displaying the inside rooms or outer building of the current location -->
  <v-card color="secondary">
    <!-- Display rooms if current location has inside rooms -->
     <v-list v-if="hasRooms">
      <v-list-tile
        v-for="inside in insideRooms"
        :key="inside.id"
        :to="`/map/details/${inside.id}`"
        @click="{}"
      >
        <v-list-tile-content>
          <v-list-tile-title>{{ inside.name }}</v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
    <!-- else Display outer building if current location has an outer building -->
    <v-list v-else-if="hasBuilding">
      <v-list-tile 
        :to="`/map/details/${mainBuilding.id}`"
        @click="{}"
      >
        <v-list-tile-content>{{ mainBuilding.name }}</v-list-tile-content>
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
    // references hasRooms getter from Vuex
    hasRooms() {
      return this.$store.getters["details/hasRooms"]
    },
    // references hasBuilding getter from Vuex
    hasBuilding() {
      return this.$store.getters["details/hasBuilding"]
    },
    // reference inside rooms from Vuex store
    insideRooms() {
      return this.$store.state.details.insideRooms;
    },
    // reference outer building from Vuex store
    mainBuilding() {
      return this.$store.state.details.mainBuilding;
    }
  }
};
</script>

<style>
</style>
