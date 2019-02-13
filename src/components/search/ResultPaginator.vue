<template>
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
    maxPages() {
      return this.$store.state.search.maxPages
    },
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
    pageNumber() {
      this.$emit("change")
    }
  }
}
</script>

<style>
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
