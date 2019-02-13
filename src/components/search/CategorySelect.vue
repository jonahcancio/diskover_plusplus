<template>
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
  data() {
    return {
      // activeFilters: []
    };
  },
  computed: {
    categories() {
      return this.$store.getters["categoryNames"];
    },
    activeFilters: {
      get() {
        return this.$store.state.search.activeFilters;
      },
      set(value) {
        this.$store.commit("search/setFilters", value);
        this.$emit("change");
      }
    }
  }
  // watch: {
  //   activeFilters(to) {
  //     this.$store.commit("search/setFilters", to)
  //     this.$emit("change")
  //   }
  // }
};
</script>

<style>
#category-select .v-chip {
  background-color: var(--v-primary-base) !important;
  color: white;
}
</style>
