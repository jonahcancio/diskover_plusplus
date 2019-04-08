<template>
  <!-- selection input with multiple category chips -->
  <div id="category-select">
    <v-select
      v-model="tagsFilter"
      :items="tags"
      attach
      small-chips
      label="Tags"
      multiple
      clearable
    />
  </div>
</template>

<script>
export default {
  computed: {
    // reference tags from Vuex store
    tags() {
      return this.$store.getters["tagNames"];
    },
    // referencing the apiQuery from the Vuex store
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    },
    // reference active category filters from Vuex store
    tagsFilter: {
      get() {
        return this.$store.state.admin.locations.tagsFilter;
      },
      // set active filters in Vuex store and trigger a change event when chip is selected
      set(value) {
        this.$store.commit("search/setTagsFilter", value);
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
