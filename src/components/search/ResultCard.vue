<template>
  <v-hover>
    <v-card
      class="secondary-bg my-2 overflow-hidden"
      slot-scope="{ hover }"
      :class="`elevation-${hover ? 12 : 2}`"
      :to="`/map/details/${result.id}`"
    >
      <v-layout wrap>
        <v-flex xs3>
          <v-img contain height="70px" :src="thumbnailUrl"/>
           <!-- <v-img contain height="60px" :src="thumbnailUrl" :srcset="`${defaultThumbnail}`"/> -->
        </v-flex>
        <v-flex xs9>
          <v-card-title class="title">{{ result.name }}</v-card-title>
        </v-flex>
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
    result: {
      type: Object
    }
  },
  data() {
    return {
      defaultThumbnail: require("@/assets/no-thumbnail.jpg")
    };  
  },
  mounted() {
    $clamp(this.$refs.desc, { clamp: 2 });
  },
  computed: {
    thumbnailUrl() {
      return `${this.$backendStaticPath}images/locations/${this.result.img_urls[0].img_url}`
    }
  }
};
</script>

<style>
</style>
