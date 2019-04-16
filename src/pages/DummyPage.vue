<template>
  <!-- Used to handle Web page requests that do not exist -->
  <v-container class="yellow lighten-3">
    <v-layout class="display-1 pt-4" column>
      <div id="subarea-select">
        <v-autocomplete
          v-model="model"
          :items="items"
          :loading="isLoading"
          :search-input.sync="search"
          @input="search=null"
          multiple
          cache-items
          hide-selected
          auto-select-first
          chips
          clearable
          deletable-chips
          label="Subareas"
          placeholder="Search a subarea"
          color="blue"
        />
      </div>
    </v-layout>
  </v-container>
</template>


<script>
export default {
  created() {
    this.apiGetSubareaItems("");
  },
  data: () => ({
    descriptionLimit: 60,
    subareas: [],
    isLoading: false,
    model: [13, 877],
    search: null
  }),

  computed: {
    items() {
      return this.subareas.map(sub => {
        return {
          text: sub.name,
          value: sub.id
        };
      });
    }
  },

  watch: {
    search(newSearch) {
      // Items have already been requested
      if (this.isLoading) return;

      this.isLoading = true;
      this.apiGetSubareaItems(newSearch);
    }
  },
  methods: {
    apiGetSubareaItems(searchValue) {
      this.$http
        .get(`/admin/locations`, {
          params: {
            search: searchValue,
            category_ids: [2, 3, 4, 5, 6, 7, 8]
          },
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        .then(response => {
          console.log("successful get", response.data);
          this.subareas = response.data;
        })
        // alert an error if unsuccessful GET
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error);
        })
        .finally(() => (this.isLoading = false));
    }
  }
};
</script>

<style>
#subarea-select .v-chip {
  background-color: var(--v-primary-base) !important;
  color: white;
}
</style>
