import Vue from "@/vuePrototypes"

// Vuex Store module to be used by the details components
export default {
	namespaced: true,
	state: {
		// list of important coordinates used in the route (turns, corners)
		routeCoordinates: [],
		// list of routing instructions (directions to location in focus)
		instructions: [],
		endCoords: [],
		markerIcon: "",
	},
	mutations: {
		setRouteCoordinates(state, newRouteCoordinates) {
			state.routeCoordinates = newRouteCoordinates
		},
		// set instructions 
		setInstructions(state, newInstructions) {
			state.instructions = newInstructions
		},
		// set end coordinates of location if focus
		setEndCoords(state, newEndCoords) {
			state.endCoords = newEndCoords
		},
		setMarkerIcon(state, newMarkerIcon) {
			state.markerIcon = newMarkerIcon
		}
	},
	getters: {
		fullIconUrl(state) {
			return state.markerIcon? `${Vue.prototype.$backendStaticPath}images/markers/${state.markerIcon}` : null
		},
	}
}
