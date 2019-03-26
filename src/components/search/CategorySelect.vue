<template>
  <!-- selection input with multiple category chips -->
  <div id="category-select">
    <v-select
      v-model="activeFilters"
      :items="categories"
      attach
      small-chips
      label="Category Filters"
      multiple
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
    // reference active category filters from Vuex store
    activeFilters: {  
      get() {
        return this.$store.state.search.activeFilters;
      },
      // set active filters in Vuex store and trigger a change event when chip is selected
      set(value) {
        this.$store.commit("search/setFilters", value);
        this.$emit("change");
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
