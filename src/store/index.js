import Vue from 'vue'
import Vuex from 'vuex'
import details from '@/store/details'
import search from '@/store/search'


Vue.use(Vuex)
const store = new Vuex.Store({
  modules: {
    details: details,
    search: search,
  },
  state: {
    categories: [],
    isSideDrawerVisible: true,
    isGpsPermissionToMark: false
  },
  mutations: {
    setCategories(state, newCategories) {
      state.categories = newCategories
    },
    setSideDrawer(state, isVisible) {
      state.isSideDrawerVisible = isVisible
    },
    setGpsPermissionToMark(state, gps) {
      state.isGpsPermissionToMark = gps;
    }
  },
  getters: {
    categoryNames(state) {
      return state.categories.map(cat => cat.name)
    }
  }
})

export default store
