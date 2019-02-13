<template>
  <v-app>
    <Background>
      <NavBar/>
      <v-content>
        <router-view></router-view>
      </v-content>
      <GpsMapHidden mapId="hidden-map"/>
    </Background>
  </v-app>
</template>

<script>
export default {
  name: "App",
  created() {
    this.$http
      .get(`${this.$backendApiPath}categories`)
      .then(response => {
        this.$store.commit("setCategories", response.data);
        console.log("categories successfully retrieved from API");
      })
      .catch(error => {
        console.log("error retrieving categories to API: ");
      });
    console.log("PUBLIC PATH:", this.$publicPath);
  }
};
</script>

<style scoped>
</style>
