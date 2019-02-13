<template>
  <div>
    <v-card color="secondary">
      <v-container grid-list-lg>
        <v-layout row wrap justify-start align-content-start>
          <v-flex v-for="(url, i) in imageUrls" :key="url" xs4>
            <v-hover>
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
        <div class="body-2">Click an image for a bigger view</div>
      </v-card-text>
    </v-card>
    <CenterModal width="550px" :isVisible="isCarouselVisible" @close="setCarouselModal(false)">
      <v-card>
        <v-carousel :cycle="false" v-model="carouselIndex">
          <v-carousel-item v-for="(url, i) in imageUrls" :key="i">
            <v-img :src="url" height="100%" position="center top"></v-img>
          </v-carousel-item>
        </v-carousel>
      </v-card>
    </CenterModal>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isCarouselVisible: false,
      carouselIndex: 0
    };
  },
  computed: {
    imageUrls() {
      return this.$store.getters["details/fullImageUrls"];
    }
  },
  methods: {
    setCarouselModal(value) {
      this.isCarouselVisible = value;
    },
    openCarouselModalAt(index) {
      this.isCarouselVisible = true;
      this.carouselIndex = index;
    }
  }
};
</script>

<style>
</style>
