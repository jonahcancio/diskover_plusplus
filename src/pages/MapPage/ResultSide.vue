<template>
  <!-- renders the location results of a search/filter query on the side drawer -->
  <div>
    <!-- headline for describing results -->
    <p class="headline">{{headlineText}}</p>
    <!-- category select for filtering by categories -->
    <CategorySelect @change="applyRouteQueries"/>    
    <v-layout justify-end>
      <!-- sort select for sorting by different attributes -->
      <v-flex xs6>
        <SortSelect @change="applyRouteQueries"/>
      </v-flex>
    </v-layout>
    <p class="subheading">{{resultCount}} results found</p>
    <!-- show 10 results a result cards in a column -->
    <v-layout column>
      <ResultCard v-for="result in results" :key="result.id" :result="result"/>
    </v-layout>
    <!-- paginator for controlling page of results -->
    <ResultPaginator @change="applyRouteQueries"/>
  </div>
</template>


<script>
export default {
  // called when page is created
  created() {
    // refresh as if route changed
    this.handleRouteChange()
    // set default pagination
    this.handleDefaultPagination()
  },
  computed: {
    // reference Vuex Store results from the search module
    results() {
      return this.$store.state.search.results;
    },
    // reference total number of results found from Vuex Store search module
    resultCount() {
      return this.$store.state.search.totalResultCount
    },
    // return headline text based on current search queries
    headlineText() {
      if (this.searchText) {
        return `You searched for "${this.searchText}"`;
      } else {
        return "Showing all results";
      }
    },
    // reference categories from Vuex Store for category select
    categories() {
      return this.$store.getters["categoryNames"];
    },
    // reference searchText (text on search bar) from Vuex Store search module
    searchText() {
      return this.$store.state.search.searchText;
    },
    // reference apiQuery object from Vuex Store search module 
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    }
  },
  watch: {
    //handle route change
    $route() {
      this.handleRouteChange();
    }
  },
  methods: {
    // perform HTTP GET request to api and fetch results based on current apiQueries found on Vuex Store search module
    applyApiQueries() {
      // HTTP GET Request with appropriate querystring
      this.$http
        .get(`${this.$backendApiPath}location`, {
          params: this.apiQuery,
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        // save results to Vuex Store search module if GET was successful
        .then(response => {
          this.$store.commit("search/setResults", response.data.results);
          this.$store.commit("search/setMaxPages", response.data.total_pages);
          this.$store.commit("search/setTotalResultCount", response.data.count);
          console.log(
            "successfully received queried results from API: ",
            response
          );
        })
        // alert an error if unsuccessful GET
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error)
        });
    },
    // apply apiQuery for Vuex Store towards the url route
    applyRouteQueries() {
      this.$router.replace({
        name: "search",
        query: this.apiQuery
      });
    },
    //reads route queries and synchs with api queries in Vuex Store search module
    handleRouteChange() {
      this.$store.commit("search/setApiQuery", this.$route.query);
      this.applyApiQueries();
    },
    //adds a default page=1 if pagination non-existent on route
    handleDefaultPagination() {
      if (!("page" in this.$route.query)) {
        let pagedQuery = {
          ...this.$route.query,
          page: 1
        }
        this.$router.replace({name: this.$route.name, query: pagedQuery})
      }
    }
  },
  // reset all results in Vuex Store search module if results page is destroyed
  destroyed() {
    this.$store.commit("search/resetAll");
  }
};
</script>