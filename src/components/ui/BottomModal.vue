<template>
  <div class="text-xs-center">
    <v-bottom-sheet inset v-model="myVisible">
      <slot></slot>
    </v-bottom-sheet>
  </div>
</template>

<script>
export default {
  props: {
    isVisible: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    myVisible: {
      get() {
        return this.isVisible;
      },
      set(value) {
        this.$emit("close");
      }
    },
  }
};
</script>

<style scoped>
</style>
