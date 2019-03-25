<template>
  <!-- Search field for inputting search queries -->
  <!-- Navigates to result page when Enter is pressed -->
  <v-text-field
    class="nav-search"
    label="Where to?"
    placeholder="Search away!"
    solo
    hide-details
    height="1em"
    v-model="searchText"
    @keypress.enter="emitSearch"
  >
    <!-- Navigate to result page when search button is pressed -->
    <v-btn color="primary" slot="append" icon dark @click.stop="emitSearch">
      <v-icon>search</v-icon>
    </v-btn>
  </v-text-field>
</template>

<script>
export default {
  data() {
    return {
      // stores the text that has been typed in the search bar
      searchText: ""
    };
  },
  computed: {
    // referencing the apiQuery from the Vuex store
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    }
  },
  methods: {
    // used to set search values to the apiQuery in Vuex store and then navigate to the results page
    emitSearch() {
      this.$store.commit("search/setSearchText", this.searchText);
      this.$store.commit("setSideDrawer", true);
      this.$router.push({
        path: "/map/search",
        query: this.apiQuery
      });
    }
  }
};
</script>

<style scoped>
.nav-search {
  align-self: center;
}
</style>
