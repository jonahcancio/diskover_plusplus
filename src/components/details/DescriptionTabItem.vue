<template>
  <!-- Tab item for displaying the current location description  -->
  <v-card color="secondary">
    <v-container>
      <span class="body-1">{{ description }}</span>
    </v-container>
  </v-card>
</template>

<script>
export default {
  props: {
    description: {
      type: String,
      default: "No description found."
    }
  },
};
</script>

<style>
</style>
