<template>
  <!-- Card for showing a location search result, shadow effect on hover -->
    <v-card flat class="secondary overflow-hidden">
      <v-layout fill-height>
        <v-flex xs1>
          <!-- <v-img contain height="50px" :src="thumbnailUrl"/> -->
        </v-flex>
        <v-flex xs3>
          <div class="body-1 fill-height px-2">{{ result.name }}</div>
        </v-flex>
        <!-- result description on bottom right -->
        <v-flex xs6>
          <div ref="desc" class="fill-height px-2">{{ result.description }}</div>
        </v-flex>
        <v-flex xs2>
          <v-layout class="fill-height" justify-end>
            <v-btn icon dark color="blue" :to="`/form/update/${result.id}`">
              <v-icon>edit</v-icon>
            </v-btn>
            <v-btn icon color="error" :to="`/form/delete/${result.id}`">
              <v-icon>delete</v-icon>
            </v-btn>
          </v-layout>
        </v-flex>
      </v-layout>
      <v-divider></v-divider>
    </v-card>
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
      return `${this.$backendStaticPath}images/locations/${
        this.result.thumbnail_url
      }`;
    }
  }
};
</script>

<style>
.fill-height {
  height: 100% !important;
}

.bordered {
  border: 1px solid black !important;
}
</style>
