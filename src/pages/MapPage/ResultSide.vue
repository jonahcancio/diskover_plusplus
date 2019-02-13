<template>
  <div>
    <p class="headline">{{headlineText}}</p>
    <!-- <h4>Category Filters</h4>
    <v-layout wrap>
      <CategoryChip
        v-for="(category, i) in categories"
        :key="i"
        :category="category"
        @change="applyRouteQueries"
      />
    </v-layout>-->
    <CategorySelect @change="applyRouteQueries"/>
    <v-layout justify-end>
      <v-flex xs6>
        <SortSelect @change="applyRouteQueries"/>
      </v-flex>
    </v-layout>
    <p class="subheading">{{resultCount}} results found</p>
    <v-layout column>
      <ResultCard v-for="(result, i) in results" :key="i" :result="result"/>
    </v-layout>
    <ResultPaginator @change="applyRouteQueries"/>
  </div>
</template>


<script>
export default {
  created() {
    this.handleRouteChange();
  },
  computed: {
    results() {
      return this.$store.state.search.results;
    },
    resultCount() {
      return this.$store.state.search.totalResultCount
    },
    headlineText() {
      if (this.searchText) {
        return `You searched for "${this.searchText}"`;
      } else {
        return "Showing all results";
      }
    },
    categories() {
      return this.$store.getters["categoryNames"];
    },
    searchText() {
      return this.$store.state.search.searchText;
    },
    apiQuery() {
      return this.$store.getters["search/apiQuery"];
    }
  },
  watch: {
    //USES THE API EVERYTIME ROUTE IS CHANGED
    $route() {
      this.handleRouteChange();
    }
  },
  methods: {
    applyApiQueries() {
      this.$http
        .get(`${this.$backendApiPath}location`, {
          params: this.apiQuery,
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        .then(response => {
          this.$store.commit("search/setResults", response.data.results);
          this.$store.commit("search/setMaxPages", response.data.total_pages);
          this.$store.commit("search/setTotalResultCount", response.data.count);
          console.log(
            "successfully received queried results from API: ",
            response
          );
        })
        .catch(error => {
          console.log("error receiving queried results from API: ", error);
        });
    },
    applyRouteQueries() {
      this.$router.replace({
        name: "search",
        query: this.apiQuery
      });
    },
    handleRouteChange() {
      this.$store.commit("search/setApiQuery", this.$route.query);
      this.applyApiQueries();
    }
  },
  destroyed() {
    this.$store.commit("search/resetAll");
  }
};
</script>