// Vuex Store module to be used by the Admin Location components
export default {
	namespaced: true,
	state: {
		results: {},
		searchFilter: "",
		categoryFilter: "",
		tagsFilter: [],
		orderingFilter: ""
	},
	mutations: {
		setResults(state, newResults){
			state.results = newResults
		},
		setSearchFilter(state, newSearch) {
			state.searchFilter = newSearch
		},
		setCategoryFilter(state, newCategory) {
			state.categoryFilter = newCategory
		},
		setTagsFilter(state, newTags) {
			state.tagsFilter = newTags
		},
		setOrderingFilter(state, newOrdering) {
			state.orderingFilter = newOrdering
		},
		// set majority of the search fields based on the query object passed from the url route
		setApiQuery(state, queryObject) {
			if (Array.isArray(queryObject["tag"])) {
				state.tagsFilter = queryObject["tag"]
			} else if (queryObject["tag"]) {
				state.tagsFilter = [queryObject["tag"]]
			} else {
				state.tagsFilter = []
			}
			state.orderingFilter = queryObject["ordering"]
			state.searchFilter = queryObject["search"]
			state.categoryFilter = queryObject["category"]
		},
	},
	getters: {
		// returns the api query to be included with every GET request to the API
		apiQuery(state) {
			let queryObject = {}
			if (state.categoryFilter) {
				queryObject["category"] = state.categoryFilter
			}
			if (state.orderingFilter) {
				queryObject["ordering"] = state.orderingFilter
			}
			if (state.searchFilter) {
				queryObject["search"] = state.searchFilter
			}
			if (state.tagsFilter && state.tagsFilter.length) {
				queryObject["tag"] = state.tagsFilter
			}
			return queryObject
		}
	},
	actions: {
		
	}
}
