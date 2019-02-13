export default {
	namespaced: true,
	state: {
		results: [],
		activeFilters: [],
		orderBy: "",
		sortBy: "",
		searchText: "",
		pageNumber: 1,
		maxPages: 4,
		totalResultCount: 0
	},
	mutations: {
		setResults(state, newResults) {
			state.results = newResults
		},
		setFilters(state, newFilters) {
			state.activeFilters = newFilters
		},
		addFilter(state, newFilter) {
			if (!state.activeFilters.includes(newFilter)) {
				state.activeFilters.push(newFilter)
			}
		},
		removeFilter(state, remFilter) {
			state.activeFilters.splice(state.activeFilters.indexOf(remFilter), 1)
		},
		resetFilters(state) {
			state.activeFilters = []
		},
		setOrderBy(state, newOrderBy) {
			state.orderBy = newOrderBy
		},
		setSortBy(state, newSortBy) {
			state.sortBy = newSortBy
		},
		setSearchText(state, newSearchText) {
			state.searchText = newSearchText
		},
		setPageNumber(state, newPageNumber) {
			state.pageNumber = newPageNumber
		},
		setMaxPages(state, newMaxPages) {
			state.maxPages = newMaxPages
		},
		setTotalResultCount(state, newCount) {
			state.totalResultCount = newCount
		},
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
		resetAll(state) {
			state.results = []
			state.activeFilters = []
			state.orderBy = ""
			state.sortBy = ""
			state.searchText = ""
		}
	},
	getters: {
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
