import Vue from "@/vuePrototypes"

// Vuex Store module to be used by the Search components
export default {
	namespaced: true,
	state: {
		// a list of search result objects
		results: [],
		// all filters
		searchFilter: "",
		categoryFilter: "",
		tagsFilter: [],
		orderingFilter: "",
		// the current page number at the results page
		pageNumber: 1,
		// the total number of pages needed for results
		maxPages: 4,
		// the total number of results found
		totalResultCount: 0
	},
	mutations: {
		// set the results
		setResults(state, newResults) {
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
		// set the current pageNumber
		setPageNumber(state, newPageNumber) {
			state.pageNumber = newPageNumber
		},
		// set the total number of pages
		setMaxPages(state, newMaxPages) {
			state.maxPages = newMaxPages
		},
		// set the total number of results
		setTotalResultCount(state, newCount) {
			state.totalResultCount = newCount
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
			state.pageNumber = queryObject["page"]
		},
		// reset all the search fields back to null values
		resetAll(state) {
			state.results = []
			state.tagsFilter = []
			state.orderingFilter = ""
			state.categoryFilter = ""
			state.searchFilter = ""
		}
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
			if (state.pageNumber) {
				queryObject["page"] = state.pageNumber
			}
			return queryObject
		},
		resultCoords(state) {
			return state.results.map(result => [result.lat, result.lng])
		},
		resultIconUrls(state) {
			return state.results.map(
				result => result.marker_icon? `${Vue.prototype.$backendStaticPath}images/markers/${result.marker_icon}` : null
			);
		}
	}
}
