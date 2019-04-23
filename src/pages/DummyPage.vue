<template>
  <!-- Used to handle Web page requests that do not exist -->
  <v-container class="yellow lighten-3">
    <v-layout class="display-1 pt-4" column>
      <div id="map" :style="{height: height}"></div>
    </v-layout>
  </v-container>
</template>


<script>
import MapMixin from "@/mixins/MapMixin";
export default {
  mixins: [MapMixin],
  created() {
    this.getUpdateData(this.locationId);
  },
  mounted() {
    this.addMarker(
      this.$defaultStartCoords,
      {
        draggable: true,
        icon: this.getIcon("http://localhost:8000/static/images/markers/toileticon.png"),
      },
      "You are here. Drag me all you like."
    ).on("click", () => {
      console.log("CLICKCK")
    });
  },
  computed: {
    locationId() {
      return this.$route.params.id;
    }
  },
  methods: {
    getUpdateData(id) {
      this.$http
        .get(`/admin/locations/images/${id}`)
        .then(response => {
          console.log(
            "successful retrieved location update/delete data from API: ",
            response.data
          );
        })
        .catch(error => {
          console.log(
            "error retrieving location update/delete data from API: ",
            error
          );
        });
    }
  }
};
</script>

<style>
</style>
