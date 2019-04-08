<template>
  <!-- selection field for inputting how results are sorted -->
  <v-select :items="sortItems" label="Sort by..." clearable attach v-model="sortFilter"/>
</template>

<script>
export default {
  data() {
    return {
      // items whose text will appear as sort choices and the value each one corresponds to
      sortItems: [
        { text: "alphabetically (a-z)", value: "name" },
        { text: "alphabetically (z-a)", value: "-name" },
        { text: "least recently added", value: "id" },
        { text: "most recently added", value: "-id" }
      ],
      // the overall sorting choiced picked by the user
      sortChoice: this.$route.query["ordering"]
    };
  },
  computed: {
    // referencing the apiQuery from the Vuex store
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    },
     // reference active category filters from Vuex store
    sortFilter: {
      get() {
        return this.$store.state.search["orderingFilter"];
      },
      set(value) {
        this.$store.commit("search/setOrderingFilter", value);
        this.$router.push({
          name: "search",
          query: this.apiQuery
        });
      }
    }
  },
};
</script>
