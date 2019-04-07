<template>
  <!-- Vuetify requires everything to be enveloped by v-app -->
  <v-app>
    <!-- Fix the default Background and Navbar to always appear no matter the page -->
    <Background>
      <NavBar/>
      <v-content>
        <!-- Vue Router controls the page displayed in router-view based on url route-->
        <router-view></router-view>
      </v-content>
      <!-- GpsMapHidden is a hidden-map that handles GPS geolocation in the background -->
      <GpsMapHidden mapId="hidden-map"/>
    </Background>
  </v-app>
</template>

<script>
export default {
  name: "App",

  // called when App is created
  created() {
    // if logged in, set the authentication headers of axios to allow authenticated api use
    if (this.isLoggedIn) {
      this.$store.commit("auth/initAuthHeader");
    }

    // GET request the categories from the server
    this.$http
      .get("/categorys")
      // store categories in the base Vuex store if successful GET
      .then(response => {
        this.$store.commit("setCategories", response.data);
      })
      //alert error if unsuccessful GET
      .catch(error => {
        alert("error retrieving categories from API");
      });

    // GET request the tags from the server
    this.$http
      .get("/tags")
      // store categories in the base Vuex store if successful GET
      .then(response => {
        this.$store.commit("setTags", response.data);
      })
      //alert error if unsuccessful GET
      .catch(error => {
        alert("error retrieving categories from API");
      });
  },
  watch: {
    // verify the auth token everytime the url route changes
    $route(to, from) {
      this.$store.dispatch("auth/verifyToken");
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters["auth/isLoggedIn"];
    },
  }
};
</script>

<style scoped>
</style>
