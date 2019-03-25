<template>
  <!-- renders a modal anchored to the center, visibility controlled by myVisible -->
  <div class="text-xs-center">
    <v-dialog :width="width" :max-width="maxWidth" v-model="myVisible">
      <slot></slot>
    </v-dialog>
  </div>
</template>

<script>
export default {
  props: {
    // isVisible prop allows parent component to control modal visibility
    isVisible: {
      type: Boolean,
      default: true
    },
    // allow parent component to specify width of modal
    width: {
      type: [String, Number],
      default: "auto"
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
    // limit the maxWidth based on device width for mobile friendliness
    maxWidth() {
      return this.$vuetify.breakpoint.smAndUp? "70%" : "100%"
    }
  }
};
</script>

<style scoped>
</style>
