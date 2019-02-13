<template>
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
      sortItems:[ 
        {text: "alphabetically (a-z)", value: "name asc"},
        {text: "alphabetically (z-a)", value: "name desc"},
        {text: "lowest id", value: "id asc"},
        {text: "highest id", value: "id desc"}
      ],
      sortChoice: `${this.$route.query["_sort"]} ${this.$route.query["_order"]}`
    }
  },
  watch: {
    sortChoice(newChoice) {
      let [ sortBy, orderBy ] = newChoice? newChoice.split(" ") : [null, null] 
      this.$store.commit("search/setSortBy", sortBy)
      this.$store.commit("search/setOrderBy", orderBy)
      this.$emit("change")
    }
  }
}
</script>
