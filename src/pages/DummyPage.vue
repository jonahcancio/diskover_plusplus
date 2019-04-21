<template>
  <!-- Used to handle Web page requests that do not exist -->
  <v-container class="yellow lighten-3">
    <v-layout class="display-1 pt-4" column></v-layout>
  </v-container>
</template>


<script>
export default {
  created() {
    this.getUpdateData(this.locationId)
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
