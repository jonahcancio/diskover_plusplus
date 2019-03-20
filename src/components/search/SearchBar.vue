<template>
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
    <v-btn color="primary" slot="append" icon dark @click.stop="emitSearch">
      <v-icon>search</v-icon>
    </v-btn>
  </v-text-field>
</template>

<script>
export default {
  data() {
    return {
      searchText: ""
    };
  },
  computed: {
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    }
  },
  methods: {
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
