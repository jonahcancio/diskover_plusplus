<template>
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
      <div class="panel-content">
        <slot name="content"></slot>
      </div>
    </v-card>
  </v-hover>
</template>

<script>
export default {
  props: ["ripple"]
};
</script>

<style scoped>
.panel-card {
  /* height: 100%; */
  display: flex;
  flex-flow: column;
}

.panel-content {
  /* min-height: 50vh; */
  height: 100%;
  background-color: #ffe6e6 !important;
}
</style>
