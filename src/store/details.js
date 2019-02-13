export default {
	namespaced: true,
	state: {
		routeCoordinates: [],
		instructions: [],
		description: "The Black Panther has been the protector of Wakanda for many generations",
    startCoords: [],
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
		setStartCoords(state, newStartCoords) {
			state.startCoords = newStartCoords
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
}
