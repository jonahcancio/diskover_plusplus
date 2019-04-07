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
        {text: "alphabetically (a-z)", value: "name"},
        {text: "alphabetically (z-a)", value: "-name"},
        {text: "least recently added", value: "id"},
        {text: "most recently added", value: "-id"}
      ],
      // the overall sorting choiced picked by the user
      sortChoice: this.$route.query['ordering']
    }
  },
  watch: {
    // sets the Vuex store sortBy and orderBy values whenever sortChoice is changed by the user
    // triggers change event as well
    sortChoice(newChoice) {
      this.$store.commit("admin/locations/setOrderingFilter", newChoice)
      this.$emit("change")
    }
  }
}
</script>
