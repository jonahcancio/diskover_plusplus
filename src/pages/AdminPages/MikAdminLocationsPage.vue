<template>
  <v-container grid-list-md>
    <v-layout column>
      <!-- <CategoryTable/> -->
      <v-flex>
        <router-link :to="{name: 'form', params: {mode: 'create'}}">
          <v-btn class="primary-bg white--text">+ Add new location</v-btn>
        </router-link>
      </v-flex>

      <v-flex>
        <v-card>
          <v-card-title class="primary-bg white--text">Edit Location</v-card-title>
          <v-card-actions>
            <SearchBar/>
          </v-card-actions>
        </v-card>
      </v-flex>
      <v-flex grid-list-lg>
        <v-card color="primary">
          <v-card-title>
            <h2 class="white--text">Database</h2>
          </v-card-title>
        </v-card>
        <div v-for="category in categories" :key="category.id">
          <CategoryDropdown :category="category.name"/>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  created() {
    if (this.hasCategoriesLoaded) {
      this.getAllCategorizedLocations();
    }    
  },
  computed: {
    // reference the category names from the Vuex store
    categories() {
      return this.$store.state.categories;
    },
    hasCategoriesLoaded() {
      return this.$store.getters["hasCategoriesLoaded"]
    }
  },
  watch: {
    hasCategoriesLoaded(to, from) {
      if (to) {
        this.getAllCategorizedLocations();
      }
    }
  },
  methods: {
    getAllCategorizedLocations() {
      for (let {name: category} of this.categories) {
        this.$http
          .get(`/admin/locations/`, {
            params: {
              category: [category]
            },
            paramsSerializer: params => {
              return this.$qs.stringify(params, { indices: false });
            }
          })
          // commit each categorized location list to the admin state
          .then(response => {
            this.$store.commit("admin/setLocationsAtCategory", {
              category: category,
              data: response.data
            })
          })
          // alert an error if unsuccessful GET
          .catch(error => {
            alert("error receiving queried results from API: ");
            console.log(error);
          });
      }
    }
  }
};
</script>

<style>
</style>