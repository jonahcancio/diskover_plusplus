<template>
  <!-- Tab item for displaying the current location direction/instructions -->
  <v-card color="secondary">
    <!-- only show if list of directions if directions exist -->
    <v-list v-if="instructions && instructions.length">
      <!-- add activation of direction in Big Map upon clicking it -->
      <v-list-tile
        v-for="(inst, index) in instructions"
        :class="bgClass(index)"
        :key="inst.index"
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
    <!-- In case no directions found, display indicator -->
    <v-container v-else>
      <span class="body-2">Currently no directions available</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      // the active instruction to highlight both in the details tab and the Big Map
      // is a negative number whenever no directions are currently highlighted
      activeInst: -1
    }
  },
  computed: {
    // references directions/instructions from the Vuex store
    instructions()  {
      return this.$store.state.details.instructions
    }
  },
  methods: {
    // class to use for each instruction that accentifies its color whenver it is active
    bgClass(index) {
      return this.activeInst == index? "accent-bg" : "secondary-bg"
    },
    // toggles an instruction's activation on click
    toggleActivation(index) {
      if(this.activeInst == index){
        this.activeInst = -1;
        // trigger eventBus to clear all circles in the Big Map
        this.$eventBus.$emit("clear-circles");        
      } else {
        this.activeInst = index;
        this.$eventBus.$emit("clear-circles");  
        // trigger eventBus to add a circle at the routeCoordinate[index] of the Big Map 
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
