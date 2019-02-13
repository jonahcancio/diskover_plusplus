<template>
  <div class="text-xs-center">
    <v-dialog :max-width="maxWidth" v-model="myVisible">
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
