<template>
  <div class="up-background" :style="backgroundImageStyle">
    <slot></slot>
  </div>
</template>

<script>
import bgImg from '@/assets/backgrounds/bgimg_light.jpg'

export default {
  data: () => ({
    backgroundImageStyle: {
      backgroundImage: `url(${bgImg})`
    },
  }),
}
</script>

<style scoped>
.up-background {
  background-size: cover;
  background-position: center center;
  overflow: auto;
  min-height: 100vh;
}
</style>
