<template>
  <!-- Homepage of diskover shown at default https://diskover.up.edu.ph -->
  <div>
    <!-- BIG Homepage photo with parallax effects -->
    <v-card>
      <v-parallax :src="require('@/assets/backgrounds/bgimg.jpg')" height="350" dark>
        <v-layout align-center justify-center column>
          <h1 class="display-3 font-weight-light mb-3 diskover-title">DISKOVER ++</h1>
          <v-flex shrink class="subheader">
            <p class="caption text-xs-center">
              Diskover++ is a project from students of the Department of Computer Science in UP Diliman. <br/>
              Please help us by reporting broken links or providing comments and suggestions through this form. We need your feedback to help us improve the site.
            </p>
          </v-flex>
        </v-layout>
      </v-parallax>
    </v-card>

    <!-- Quick Home page links and widgets -->
    <v-container fluid>
      <!-- White semi-transparent overlay -->
      <v-card class="pull-up" color="rgba(255, 230, 230, 0.7)">
        <v-card-title>
          <h1 class="display-1">Where would you like to go?</h1>
        </v-card-title>
        <v-container grid-list-lg fluid>
          <v-layout v-bind="homeLayout" fill-height>
            <!-- Search widget -->
            <v-flex xs4>              
              <InfoCard>
                <h2 slot="title" class="title white--text">Use our search bar</h2>
                <SearchBar slot="content"/>
              </InfoCard>
            </v-flex>
            <!-- Map widget -->
            <v-flex xs4>
              <router-link to="/map" class="no-underline">
                <InfoCard ripple>
                  <h2 slot="title" class="title white--text">Use the map</h2>
                  <!-- <Minimap slot="content" height="200px"/> -->
                  <v-img
                    slot="content"
                    :src="require('@/assets/images/mini_map.png')"
                    height="200px"
                    position="center bottom"
                  />
                </InfoCard>
              </router-link>
            </v-flex>
            <!-- Category Cards widget -->
            <v-flex xs4>
              <InfoCard>
                <h2 slot="title" class="title white--text">Select a category</h2>
                <v-layout wrap slot="content" class="pa-3">
                  <v-flex v-for="(item, i) in categories" :key="i" xs6 sm4 md6>
                    <CategoryCard :category="item"/>
                  </v-flex>
                </v-layout>
              </InfoCard>
            </v-flex>
          </v-layout>
        </v-container>
      </v-card>
    </v-container>
  </div>
</template>

<script>
export default {
  computed: {
    // reference the category names from the Vuex store to render the cat cards
    categories() {
      return this.$store.getters["categoryNames"];
    },
    // set the layout to be a single row if device width is wide enough, else single column it for mobile
    homeLayout() {
      return {
        column: !this.$vuetify.breakpoint.mdAndUp,
        row: this.$vuetify.breakpoint.mdAndUp
      }
    }
  }
};
</script>

<style scoped>
.pull-up {
  top: -100px !important;
}

.diskover-title {
text-shadow: 0px 1px 3px #000000;
}

.no-underline {
  text-decoration: none;
}
</style>
