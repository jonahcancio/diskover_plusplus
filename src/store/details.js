import Vue from "@/vuePrototypes"

export default {
	namespaced: true,
	state: {
		routeCoordinates: [],
		instructions: [],
		description: "",
		endCoords: [],
		insideRooms: [],
		nearbyLocations: [],
		outerBuilding: "",
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
		},
		setInsideRooms(state, newInsideRooms) {
			state.insideRooms = newInsideRooms
		},
		setNearbyLocations(state, newNearbyLocations) {
			state.nearbyLocations = newNearbyLocations
		},
		setOuterBuilding(state, newOuterBuilding) {
			state.outerBuilding = newOuterBuilding
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
