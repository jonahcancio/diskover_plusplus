<template>
  <!-- Side Drawer for showing results and details alongside map anchored left -->
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
        <div class="pb-3">
          <SearchBar/>
        </div>
        <slot></slot>
      </div>
    </v-navigation-drawer>
  </div>
</template>

<script>
export default {
  props: {
    // allow parent component to specify height of drawer
    height: {
      type: String,
      default: "90vh"
    }
  },
  computed: {
    // references Vuex isSideDrawerVisible state to control visibility
    isVisible: {
      get() {
        return this.$store.state.isSideDrawerVisible;
      },
      set(value) {
        this.$store.commit("setSideDrawer", value);
      }
    }
  },
  // called when side drawer is ready for rendering
  mounted() {
    // set side drawer to react to visibility toggle events triggered in eventBus by FloatingButtons
    this.$eventBus.$on("toggle-side-drawer", this.toggleVisibilty);
  },
  methods: {
    // toggle visibilty (visibile becomes invisible, invisible becomes visible)
    toggleVisibilty() {
      this.isVisible = !this.isVisible;
    }
  },
  // unbind side drawer toggling if side drawer is destroyed
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
