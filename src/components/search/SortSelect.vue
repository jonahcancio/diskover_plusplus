<template>
  <!-- selection field for inputting how results are sorted -->
  <v-select 
    :items="sortItems"
    label="sort by..."
    clearable
    attach
    v-model="sortChoice"  
  />
</template>

<script>
export default {
  data() {
    return {
      // items whose text will appear as sort choices and the value each one corresponds to
      sortItems:[ 
        {text: "alphabetically (a-z)", value: "name asc"},
        {text: "alphabetically (z-a)", value: "name desc"},
        {text: "least recently added", value: "id asc"},
        {text: "most recently added", value: "id desc"}
      ],
      // the overall sorting choiced picked by the user
      sortChoice: `${this.$route.query["_sort"]} ${this.$route.query["_order"]}`
    }
  },
  watch: {
    // sets the Vuex store sortBy and orderBy values whenever sortChoice is changed by the user
    // triggers change event as well
    sortChoice(newChoice) {
      let [ sortBy, orderBy ] = newChoice? newChoice.split(" ") : [null, null] 
      this.$store.commit("search/setSortBy", sortBy)
      this.$store.commit("search/setOrderBy", orderBy)
      this.$emit("change")
    }
  }
}
</script>
