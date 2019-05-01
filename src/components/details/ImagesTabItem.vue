<template>
  <!-- Tab Item for displaying the images of the current location -->
  <div class="mb-3">
    <v-card color="secondary">
      <v-container grid-list-lg>
        <v-layout row wrap justify-start align-content-start>
          <v-flex v-for="(url, i) in fullImageUrls" :key="url" xs4>
            <v-hover>
              <!-- toggle image card to openCarouselModal on click -->
              <v-card
                slot-scope="{ hover }"
                :class="`elevation-${hover ? 12 : 2}`"
                @click="openCarouselModalAt(i)"
                tile
              >
                <v-img :src="url" :aspect-ratio="1"></v-img>
              </v-card>
            </v-hover>
          </v-flex>
        </v-layout>
      </v-container>
      <v-card-text>
        <div v-if="!fullImageUrls || !fullImageUrls.length" class="body-2">No images found for this location</div> 
        <div v-else class="body-2">Click an image for a bigger view</div>
      </v-card-text>
    </v-card>
    <!-- Carousel Modal for showing a bigger view of the images -->
    <CenterModal width="550px" :isVisible="isCarouselVisible" @close="setCarouselModal(false)">
      <v-card>
        <v-carousel :cycle="false" v-model="carouselIndex">
          <v-carousel-item v-for="(url, i) in fullImageUrls" :key="i">
            <v-img :src="url" height="100%" position="center top"></v-img>
          </v-carousel-item>
        </v-carousel>
      </v-card>
    </CenterModal>
  </div>
</template>

<script>
export default {
  props: {
    imageUrls: {
      default: []
    }
  },
  data() {
    return {
      // controls visibility of carousel modal
      isCarouselVisible: false,
      // controls the index of the currently displayed image on the carousel
      carouselIndex: 0
    };
  },
  computed: {
    // references the image urls from the Vuex store
    fullImageUrls() {
      return this.imageUrls.map(
				url => `${this.$backendStaticPath}images/locations/${url}`
			)
    }
  },
  methods: {
    // set the carousel modal visibility
    setCarouselModal(value) {
      this.isCarouselVisible = value;
    },
    // open the carousel modal to picture at index
    openCarouselModalAt(index) {
      this.isCarouselVisible = true;
      this.carouselIndex = index;
    }
  }
};
</script>

<style>
</style>
