import Vue from 'vue'
import Vuex from 'vuex'
import details from '@/store/details'
import search from '@/store/search'
import map from '@/store/map'
import auth from '@/store/auth'


// Initialize Vuex Store
Vue.use(Vuex)

//Configure Vuex Store
const store = new Vuex.Store({
  // declare the substore modules to be used
  modules: {
    details: details,
    search: search,
    map: map,
    auth: auth,
  },
  // base state variables to be used
  state: {
    // stores list of categories GETed by App component
    categories: [],
    tags: [],
    // controls when ui/SideDrawer component is visible on left or tucked away
    isSideDrawerVisible: true,
  },
  // base mutations for setting the base state
  mutations: {
    // set categories
    setCategories(state, newCategories) {
      state.categories = newCategories
    },
    setTags(state, newTags) {
      state.tags = newTags
    },
    // set isSideDrawerVisible
    setSideDrawer(state, isVisible) {
      state.isSideDrawerVisible = isVisible
    },
  },
  // base getters for getting computed properties from base state
  getters: {
    // get a list of only the name fields of each category object
    categoryNames(state) {
      return state.categories.map(cat => cat.name)
    },
    tagNames(state) {
      return state.tags.map(tag => tag.name)
    },
    hasCategoriesLoaded(state) {
      return state.categories && state.categories.length != 0
    }
  }
})

export default store
