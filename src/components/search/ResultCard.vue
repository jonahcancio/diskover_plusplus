<template>
  <!-- Card for showing a location search result, shadow effect on hover -->
  <v-hover>
    <v-card
      class="secondary-bg my-2 overflow-hidden"
      slot-scope="{ hover }"
      :class="`elevation-${hover ? 12 : 2}`"
      :to="`/map/details/${result.id}`"
    >
      <v-layout wrap>
        <!-- thumbnail pic on top left -->
        <v-flex xs3>
          <v-img contain height="70px" :src="thumbnailUrl"/>
        </v-flex>
        <!-- result name on top right -->
        <v-flex xs9>
          <v-card-title class="title">{{ result.name }}</v-card-title>
        </v-flex>
        <!-- result description on bottom right -->
        <v-card-text class="custom">
          <div ref="desc">{{ result.description }}</div>
        </v-card-text>
      </v-layout>
    </v-card>
  </v-hover>
</template>

<script>
export default {
  props: {
    // parent component specifies the result to display
    result: {
      type: Object
    }
  },
  data() {    
    return {
      // default thumbnail to use in case result doesn't have an image
      defaultThumbnail: require("@/assets/no-thumbnail.jpg")
    };  
  },
  // called when card is ready for rendering
  mounted() {
    // clamps the description text to a maximum of two lines; truncates with ellipsis
    $clamp(this.$refs.desc, { clamp: 2 });
  },
  computed: {
    // complete the full thumbnail url using the backend static path and the thumbnail url
    thumbnailUrl() {
      return `${this.$backendStaticPath}images/locations/${this.result.thumbnail_url}`
    }
  }
};
</script>

<style>
</style>
