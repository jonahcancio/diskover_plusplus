<template>
  <!-- Card used in homepage for displaying info -->
  <!-- Has dark read header and light pink body -->
  <!-- Has shadow effect on hover and ripple effect on click -->
  <v-hover>
    <v-card
      :ripple="ripple"
      slot-scope="{ hover }"
      class="panel-card"
      :class="`elevation-${hover ? 12 : 2}`"
    >
      <v-card-title class="white--text red pa-3">
        <slot name="title"></slot>
      </v-card-title>
      <div class="panel-content secondary">
        <slot name="content"></slot>
      </div>
    </v-card>
  </v-hover>
</template>

<script>
export default {
  // lets parent component specify if it wants ripple effect or not
  props: ["ripple"]
};
</script>

<style scoped>
.panel-card {
  display: flex;
  flex-flow: column;
}

.panel-content {
  height: 100%;
  background-color: #ffe6e6 !important;
}
</style>
