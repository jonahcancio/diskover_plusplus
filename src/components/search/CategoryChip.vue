<template>
<v-chip 
  disabled
  :color="color"
  :text-color="textColor"
  @click.prevent.stop="toggleSelect"
>
  {{ category }}
</v-chip>
</template>

<script>
export default {
  props: {
    category: {
      type: String,
      required: true
    }
  },
  data() {
    let selected = false;    
    if (this.$route.query.category) {
      selected = this.$route.query.category.includes(this.category)
    }    
    return {
      selected: selected
    }
  },
  // created() {
  //   this.$eventBus.$on("reset-filters", this.turnOff)
  // },
  methods: {
    toggleSelect() {
      this.selected = !this.selected
      if(this.selected) {
        this.$store.commit("search/addFilter", this.category)
      }else {
        this.$store.commit("search/removeFilter", this.category)
      }
      this.$emit("change")
    },
    turnOff() {
      this.selected = false
    }
  },
  computed: {
    color() {
      return this.selected? "primary" : "secondary"
    },
    textColor() {
      return this.selected? "secondary" : "primary"
    },
    activeFilters() {
      return this.$store.state.search.activeFilters
    }
  },
  watch: {
    activeFilters() {
      this.selected = this.activeFilters.includes(this.category)
    }
  },
  destroyed() {
    this.$eventBus.$off("reset-filters", this.turnOff)
  }
}
</script>
