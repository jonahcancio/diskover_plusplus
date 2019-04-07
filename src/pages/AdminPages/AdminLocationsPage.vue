<template>
  <v-container grid-list-md class="accent">
    <router-link :to="{name: 'form', params: {mode: 'create'}}">
      <v-btn class="primary-bg white--text">+ Add new location</v-btn>
    </router-link>
    <v-layout row wrap>
      <v-flex xs12>
        <AdminSearchBar/>
      </v-flex>
      <v-flex xs3>
        <AdminCategorySelect @change="applyRouteQueries"/>
      </v-flex>
      <v-flex xs6>
        <AdminTagsSelect @change="applyRouteQueries"/>
      </v-flex>
      <v-flex xs3>
        <AdminSortSelect @change="applyRouteQueries"/>
      </v-flex>
    </v-layout>
    <v-layout column>
      <v-card flat class="secondary">
        <v-layout class="body-2 text-xs-left">
          <v-flex xs1 class="px-3">Thumbnail</v-flex>
          <v-flex xs3 class="">Name</v-flex>
          <v-flex xs6 class="">Description</v-flex>
          <v-flex xs2 class="text-xs-right px-3">Actions</v-flex>
        </v-layout>
        <v-divider/>
      </v-card>
      <AdminResultCard v-for="result in results" :key="result.id" :result="result"/>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  created() {
    // refresh as if route changed
    this.handleRouteChange();
  },
  computed: {
    // reference Vuex Store results from the admin locations module
    results() {
      return this.$store.state.admin.locations.results;
    },
    // reference categories from Vuex Store for category select
    categories() {
      return this.$store.getters["categoryNames"];
    },
    // reference apiQuery object from Vuex Store admin locations module
    apiQuery() {
      return this.$store.getters["admin/locations/apiQuery"];
    }
  },
  watch: {
    //handle route change
    $route() {
      this.handleRouteChange();
    }
  },
  methods: {
    //reads route queries and synchs with api queries in Vuex Store admin locations module
    handleRouteChange() {
      this.$store.commit("admin/locations/setApiQuery", this.$route.query);
      this.applyApiQueries();
    },
    applyRouteQueries() {
      this.$router.push({
        name: "admin",
        query: this.apiQuery
      });
    },
    // perform HTTP GET request to api and fetch results based on current apiQueries found on Vuex Store search module
    applyApiQueries() {
      // HTTP GET Request with appropriate querystring
      this.$http
        .get(`/admin/locations`, {
          params: this.apiQuery,
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        // save results to Vuex Store search module if GET was successful
        .then(response => {
          this.$store.commit("admin/locations/setResults", response.data);
          console.log(response);
        })
        // alert an error if unsuccessful GET
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error);
        });
    }
  }
};
</script>

<style scoped>
</style>