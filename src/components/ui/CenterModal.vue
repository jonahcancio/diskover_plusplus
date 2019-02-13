<template>
  <div class="text-xs-center">
    <v-dialog :width="width" :max-width="maxWidth" v-model="myVisible">
      <slot></slot>
    </v-dialog>
  </div>
</template>

<script>
export default {
  props: {
    isVisible: {
      type: Boolean,
      default: true
    },
    width: {
      type: [String, Number],
      default: "auto"
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
    maxWidth() {
      return this.$vuetify.breakpoint.smAndUp? "70%" : "100%"
    }
  }
};
</script>

<style scoped>
</style>
