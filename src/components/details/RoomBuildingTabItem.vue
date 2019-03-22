<template>
  <v-card color="secondary">
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
    <v-list v-else-if="outerBuilding">
      <v-list-tile 
        :to="`/map/details/${outerBuilding.building_id}`"
        @click="{}"
      >
        <v-list-tile-content>{{ outerBuilding.building }}</v-list-tile-content>
      </v-list-tile>
    </v-list>
    <v-container v-else>
      <span class="body-2">No Rooms Found</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  computed: {
    insideRooms() {
      return this.$store.state.details.insideRooms;
    },
    outerBuilding() {
      return this.$store.state.details.outerBuilding;
    }
  }
};
</script>

<style>
</style>
