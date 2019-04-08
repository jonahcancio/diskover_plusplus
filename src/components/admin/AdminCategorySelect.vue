<template>
  <!-- selection input with multiple category chips -->
  <div id="category-select">
    <v-select
      v-model="categoryFilter"
      :items="categories"
      attach
      small-chips
      label="Select Category"
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
    categoryFilter: {  
      get() {
        return this.$store.state.admin.locations.categoryFilter;
      },
      // set category filter in Vuex and trigger a change event when chip is selected
      set(value) {
        this.$store.commit("admin/locations/setCategoryFilter", value);
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
