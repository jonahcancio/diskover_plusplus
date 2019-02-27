<template>
  <div>
    <FloatingButton attachedTo="drawer"/>
    <v-navigation-drawer
      app
      hide-overlay
      stateless
      :temporary="!$vuetify.breakpoint.mdAndUp"
      class="search-drawer accent-bg"
      :width="360"
      :height="height"
      v-model="isVisible"
    >
      <div class="px-2 pt-3">
        <SearchBar/>
        <slot></slot>
      </div>
    </v-navigation-drawer>
  </div>
</template>

<script>
export default {
  props: {
    height: {
      type: String,
      default: "90vh"
    }
  },
  computed: {
    isVisible: {
      get() {
        return this.$store.state.isSideDrawerVisible;
      },
      set(value) {
        this.$store.commit("setSideDrawer", value);
      }
    }
  },
  mounted() {
    this.$eventBus.$on("toggle-side-drawer", this.toggleVisibilty);
  },
  methods: {
    toggleVisibilty() {
      this.isVisible = !this.isVisible;
    }
  },
  destroyed() {
    this.$eventBus.$off("toggle-side-drawer", this.toggleVisibilty);
  }
};
</script>

<style>
.search-drawer {
  top: auto !important;
  z-index: 1001;
  overflow-x: visible !important;
  /* overflow-y: visible; */
}
</style>
