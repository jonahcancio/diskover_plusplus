import Vue from "@/vuePrototypes"

// Vuex Store module to be used by the details components
export default {
	namespaced: true,
	state: {
		// list of important coordinates used in the route (turns, corners)
		routeCoordinates: [],
		// list of routing instructions (directions to location in focus)
		instructions: [],
		// description of the location in focus
		description: "",
		// coordinates of the location in focus
		endCoords: [],
		// list of inside rooms of the location in focus
		insideRooms: [],
		// list of nearby locations to the location in focus
		nearbyLocations: [],
		// the outer building of the location in focus if it's a room
		outerBuilding: "",
		// the image urls of the location in focus
		imageUrls: [],
	},
	mutations: {
		// set important coordinates in route
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
		// set location description
		setDescription(state, newDescription) {
			state.description = newDescription
		},
		// set location image urls
		setImageUrls(state, newImageUrls) {
			state.imageUrls = newImageUrls
		},
		// set rooms inside location
		setInsideRooms(state, newInsideRooms) {
			state.insideRooms = newInsideRooms
		},
		// set locations nearby to location
		setNearbyLocations(state, newNearbyLocations) {
			state.nearbyLocations = newNearbyLocations
		},
		// set outerbuilding of location
		setOuterBuilding(state, newOuterBuilding) {
			state.outerBuilding = newOuterBuilding
		}
	},
	getters: {
		// returns the full image urls of a location, concatenated with the backend static path
		fullImageUrls(state) {
			return state.imageUrls.map(
				url => `${Vue.prototype.$backendStaticPath}images/locations/${url}`
			);
		},
		// returns wheter the current location HAS an outer building
		hasBuilding(state) {
			return state.outerBuilding
		},
		// returns whehter the current location IS an outer building
		isBuilding(state) {
			return state.insideRooms && state.insideRooms.length
		}
	}
}
