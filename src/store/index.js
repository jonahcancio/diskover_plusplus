import Vue from 'vue'
import Vuex from 'vuex'
import details from '@/store/details'
import search from '@/store/search'
import map from '@/store/map'

Vue.use(Vuex)
const store = new Vuex.Store({
  modules: {
    details: details,
    search: search,
    map: map
  },
  state: {
    categories: [],
    isSideDrawerVisible: true,
  },
  mutations: {
    setCategories(state, newCategories) {
      state.categories = newCategories
    },
    setSideDrawer(state, isVisible) {
      state.isSideDrawerVisible = isVisible
    },
  },
  getters: {
    categoryNames(state) {
      return state.categories.map(cat => cat.name)
    }
  }
})

export default store
