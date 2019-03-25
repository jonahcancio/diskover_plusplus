// Vuex Store module to be used by the Search components
export default {
	namespaced: true,
	state: {
		// a list of search result objects
		results: [],
		// list of currently active category filters
		activeFilters: [],
		// whether results are ordered by ascending or descending
		orderBy: "",
		// which fields the results are sorted by
		sortBy: "",
		// the text entered in the search bar
		searchText: "",
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
		// set the currently active category filters
		setFilters(state, newFilters) {
			state.activeFilters = newFilters
		},
		// add a new currently active filter
		addFilter(state, newFilter) {
			if (!state.activeFilters.includes(newFilter)) {
				state.activeFilters.push(newFilter)
			}
		},
		// remove or deactivate a filter
		removeFilter(state, remFilter) {
			state.activeFilters.splice(state.activeFilters.indexOf(remFilter), 1)
		},
		// deactivate all filters
		resetFilters(state) {
			state.activeFilters = []
		},
		// set orderBy field: asc or desc
		setOrderBy(state, newOrderBy) {
			state.orderBy = newOrderBy
		},
		// set the sortBy field
		setSortBy(state, newSortBy) {
			state.sortBy = newSortBy
		},
		// set the search text
		setSearchText(state, newSearchText) {
			state.searchText = newSearchText
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
			if (Array.isArray(queryObject["category"])) {
				state.activeFilters = queryObject["category"]
			} else if (queryObject["category"]) {
				state.activeFilters = [queryObject["category"]]
			} else {
				state.activeFilters = []
			}
			state.sortBy = queryObject["_sort"]
			state.orderBy = queryObject["_order"]
			state.searchText = queryObject["q"]
			state.pageNumber = queryObject["page"]
		},
		// reset all the search fields back to null values
		resetAll(state) {
			state.results = []
			state.activeFilters = []
			state.orderBy = ""
			state.sortBy = ""
			state.searchText = ""
		}
	},
	getters: {
		// returns the api query to be included with every GET request to the API
		apiQuery(state) {
			let queryObject = {}
			if (state.activeFilters && state.activeFilters.length) {
				queryObject["category"] = state.activeFilters
			}
			if (state.sortBy) {
				queryObject["_sort"] = state.sortBy
			}
			if (state.orderBy) {
				queryObject["_order"] = state.orderBy
			}
			if (state.searchText) {
				queryObject["q"] = state.searchText
			}
			if (state.pageNumber) {
				queryObject["page"] = state.pageNumber
			}
			return queryObject
		}
	}
}
