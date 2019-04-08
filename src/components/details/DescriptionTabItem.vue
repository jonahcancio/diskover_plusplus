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
  computed: {
    description() {
      return this.$store.state.details.description;
    }
  }
};
</script>

<style>
</style>
