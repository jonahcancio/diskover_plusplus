import Vue from "@/vuePrototypes"

// Vuex store module to be used by the map components
export default {
	namespaced: true,
	state: {
    // whether GpsMapHidden component can set originCoords to the GPS location found
    isGpsPermissionToMark: localStorage.getItem('gps') == "true"? true : false,
    // origin coordinates represent the start or current location of the user
    originCoords: Vue.prototype.$defaultStartCoords
	},
	mutations: {
    // set permission to mark
    setGpsPermissionToMark(state, gps) {
      state.isGpsPermissionToMark = gps;
      if (gps) {
        localStorage.setItem('gps', gps);
      }else {
        localStorage.removeItem('gps');
      }
    },
    //set origin coordinates
    setOriginCoords(state, coords) {
      state.originCoords = coords;
    }
	},
}
