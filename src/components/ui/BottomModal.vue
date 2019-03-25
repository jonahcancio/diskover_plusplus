<template>
  <!-- renders a modal anchored to the bottom, visibility controlled by myVisible -->
  <div class="text-xs-center">
    <v-bottom-sheet inset v-model="myVisible">
      <slot></slot>
    </v-bottom-sheet>
  </div>
</template>

<script>
export default {
  // isVisible prop allows parent component to control modal visibility
  props: {
    isVisible: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    myVisible: {
      // return isVisible by default
      get() {
        return this.isVisible;
      },
      // triggered when clicking away from modal: closes modal
      set(value) {
        this.$emit("close");
      }
    },
  }
};
</script>

<style scoped>
</style>
