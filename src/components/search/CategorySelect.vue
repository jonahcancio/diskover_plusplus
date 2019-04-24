<template>
  <!-- selection input with multiple category chips -->
  <div id="category-select">
    <v-select
      v-model="categoryFilter"
      :items="categories"
      attach
      label="Category"
      clearable
    />
  </div>
</template>

<script>
export default {
  computed: {
    // reference categories from Vuex store
    categories() {
      return this.$store.getters["categoryNames"];
    },
    // referencing the apiQuery from the Vuex store
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    },
    // reference active category filters from Vuex store
    categoryFilter: {
      get() {
        return this.$store.state.search["categoryFilter"];
      },
      set(value) {
        this.$store.commit("search/setCategoryFilter", value);
        this.$store.commit("search/setPageNumber", 1);  
        this.$router.push({
          name: "search",
          query: this.apiQuery
        });
      }
    }
  }
};
</script>

<style>
#category-select .v-chip {
  background-color: var(--v-primary-base) !important;
  color: white;
}
</style>
