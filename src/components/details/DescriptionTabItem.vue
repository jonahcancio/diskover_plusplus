<template>
  <v-card color="secondary">
    <v-container>
      <span class="body-2">{{ description }}</span>
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
