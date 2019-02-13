<template>
<v-card color="secondary">
  <v-list v-if="instructions && instructions.length">
    <v-list-tile
      v-for="(inst, index) in instructions"
      :class="bgClass(index)"
      :key="index"
      @click="toggleActivation(index)"
    >
      <v-list-tile-content>
        <v-list-tile-title> {{ inst.text }}</v-list-tile-title>
      </v-list-tile-content>
      <v-list-tile-action>
        <v-list-tile-action-text>{{ inst.distance }} m</v-list-tile-action-text>
      </v-list-tile-action>
    </v-list-tile>
  </v-list>
  <v-container v-else>
    <span class="body-2">Currently no routes available</span>
  </v-container>
</v-card>
</template>

<script>
export default {
  data() {
    return {
      activeInst: -1
    }
  },
  computed: {
    instructions()  {
      return this.$store.state.details.instructions
    }
  },
  methods: {
    bgClass(index) {
      return this.activeInst == index? "accent-bg" : "secondary-bg"
    },
    toggleActivation(index) {
      if(this.activeInst == index){
        this.activeInst = -1;
        this.$eventBus.$emit("clear-circles");        
      } else {
        this.activeInst = index;
        this.$eventBus.$emit("clear-circles");   
        this.$eventBus.$emit("add-circle", index);
      }
      
    }
  }
}
</script>

<style scoped>
.v-list {
  background-color: var(--v-secondary-base) !important;
}
</style>
