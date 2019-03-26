<template>
  <!-- renders the default background image -->
  <div class="up-background" :style="backgroundImageStyle">
    <slot></slot>
  </div>
</template>

<script>
// import default background image
import bgImg from '@/assets/backgrounds/bgimg_light.jpg'

export default {
  // set the background image
  data: () => ({
    backgroundImageStyle: {
      backgroundImage: `url(${bgImg})`
    },
  }),
}
</script>

<style scoped>
/* expand the background image to 100% page height and anchor at the center */
.up-background {
  background-size: cover;
  background-position: center center;
  overflow: auto;
  min-height: 100vh;
}
</style>
