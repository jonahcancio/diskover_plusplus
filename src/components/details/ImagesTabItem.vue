<template>
  <v-card>
    <v-carousel height="400px" :cycle="false">
      <v-carousel-item v-for="(url,i) in imageUrls" :key="i">
        <v-img :src="url" height="100%" position="center top"></v-img>
      </v-carousel-item>
    </v-carousel>
  </v-card>
</template>

<script>
export default {
  computed: {
    imageUrls() {
      let rawUrls = this.$store.state.details.imageUrls;
      return rawUrls.map(url => `${this.$backendStaticPath}images/locations/${url}`)
    }
  }
};
</script>

<style>
</style>
