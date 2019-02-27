<template>
  <v-hover>
    <v-card
      ripple
      color="primary"
      :to="{path:'/map/search', query:{category:category}}"
      slot-scope="{ hover }"
      :class="`elevation-${hover ? 12 : 2}`"
    >
      <div class="white--text body-2 text-xs-center pa-1">{{category}}</div>
      <v-img :src="defaultUrl">
        <v-img :src="imgUrl"/>
      </v-img>
    </v-card>
  </v-hover>
</template>

<script>
export default {
  props: {
    category: String
  },
  computed: {
    imgUrl() {
      let imgName = this.category || "defaultCategoryImage";
      return `${this.$backendStaticPath}images/categories/${imgName}.jpg`;
    },
    defaultUrl() {
      return `${
        this.$backendStaticPath
      }images/categories/defaultCategoryImage.jpg`;
    }
  }
};
</script>

<style>
</style>
