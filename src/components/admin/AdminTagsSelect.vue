<template>
  <!-- selection input with multiple category chips -->
  <div id="category-select">
    <v-select
      v-model="tagsFilter"
      :items="tags"
      attach
      small-chips
      label="Tag Filters"
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
    // reference active category filters from Vuex store
    tagsFilter: {  
      get() {
        return this.$store.state.admin.locations.tagsFilter;
      },
      // set active filters in Vuex store and trigger a change event when chip is selected
      set(value) {
        this.$store.commit("admin/locations/setTagsFilter", value);
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
