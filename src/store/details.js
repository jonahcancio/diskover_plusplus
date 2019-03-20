import Vue from "@/vuePrototypes"

export default {
	namespaced: true,
	state: {
		routeCoordinates: [],
		instructions: [],
		description: "",
		endCoords: [],
		imageUrls: [],
	},
	mutations: {
		setRouteCoordinates(state, newRouteCoordinates) {
			state.routeCoordinates = newRouteCoordinates
		},
		setInstructions(state, newInstructions) {
			state.instructions = newInstructions
		},
		setEndCoords(state, newEndCoords) {
			state.endCoords = newEndCoords
		},
		setDescription(state, newDescription) {
			state.description = newDescription
		},
		setImageUrls(state, newImageUrls) {
			state.imageUrls = newImageUrls
		}
	},
	getters: {
		fullImageUrls(state) {
			return state.imageUrls.map(
				url => `${Vue.prototype.$backendStaticPath}images/locations/${url}`
			);
		},
	}
}
