<template>
<!-- page buttons for navigation through result pages -->
<v-layout justify-center id="result-paginator" class="pb-4">
    <v-pagination
      v-model="pageNumber"
      :length="maxPages"
    >
    </v-pagination>
</v-layout>
</template>

<script>
export default {
  computed: {
    // reference the maximum number of pages from Vuex store
    maxPages() {
      return this.$store.state.search.maxPages
    },
    // reference the current page number from Vuex store and allow v-pagination to set it as well
    pageNumber: {
      get() {
        return parseInt(this.$store.state.search.pageNumber)
      },
      set(value) {
        this.$store.commit("search/setPageNumber", value)
      }
    }
  },
  watch: {
    // always emit a change event to the parent component if pageNumber is changed
    pageNumber() {
      this.$emit("change")
    }
  }
}
</script>

<style>
/* The following styles configure the color scheme of the pagination buttons */
#result-paginator .v-pagination__item, .v-pagination__navigation {
  background-color: var(--v-secondary-base) !important;
  color: var(--v-primary-base);
}

#result-paginator .v-pagination__navigation .v-icon{
  color: var(--v-primary-base);
}

#result-paginator .v-pagination__item--active {
  background-color: var(--v-primary-base) !important;
  color: white;
}
</style>
