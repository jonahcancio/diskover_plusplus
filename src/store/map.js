import Vue from "@/vuePrototypes"

export default {
	namespaced: true,
	state: {
    isGpsPermissionToMark: false,
    originCoords: Vue.prototype.$defaultStartCoords
	},
	mutations: {
    setGpsPermissionToMark(state, gps) {
      state.isGpsPermissionToMark = gps;
    },
    setOriginCoords(state, coords) {
      state.originCoords = coords;
    }
	},
}
