import Vue from "@/vuePrototypes"

// Vuex Store module to be used by the details components
export default {
	namespaced: true,
	state: {
		// specify the location in detail's category
		category: "",
		// list of tags binded to location
		tags: [],
		// list of important coordinates used in the route (turns, corners)
		routeCoordinates: [],
		// list of routing instructions (directions to location in focus)
		instructions: [],
		// description of the location in focus
		description: "",
		// coordinates of the location in focus
		endCoords: [],
		// dictionary of subareas keyed by category names
		subareas: [],
		// the outer building of the location in focus if it's a room
		mainBuilding: "",
		// list of nearby locations to the location in focus
		nearbyLocations: [],
		// the image urls of the location in focus
		imageUrls: [],
		// stores the marker_icon of location
		markerIcon: "",
	},
	mutations: {
		// set category
		setCategory(state, newCategory) {
			state.category = newCategory
		},
		// set tags
		setTags(state, newTags) {
			state.tags = newTags
		},
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
		// set subareas of a location
		setSubareas(state, newSubareas) {
			state.subareas = newSubareas
		},
		// set locations nearby to location
		setNearbyLocations(state, newNearbyLocations) {
			state.nearbyLocations = newNearbyLocations
		},
		// set mainBuilding of location
		setMainBuilding(state, newMainBuilding) {
			state.mainBuilding = newMainBuilding
		},
		setMarkerIcon(state, newMarkerIcon) {
			state.markerIcon = newMarkerIcon
		}
	},
	getters: {
		// returns the full image urls of a location, concatenated with the backend static path
		fullImageUrls(state) {
			return state.imageUrls.map(
				url => `${Vue.prototype.$backendStaticPath}images/locations/${url}`
			);
		},
		fullIconUrl(state) {
			return state.markerIcon? `${Vue.prototype.$backendStaticPath}images/markers/${state.markerIcon}` : null
		},
		// returns wheter the current location HAS an main building
		hasMainBuilding(state) {
			return state.mainBuilding != null
		},
		// returns whether the current location has inside_rooms
		hasSubareas(state) {
			for (let category in state.subareas) {
				if (state.subareas[category]) {
					return true
				}
			}
			return false
		},
		// returns categories of subareas
		subareaCategories(state) {
			return Object.keys(state.subareas);
		}
	}
}
