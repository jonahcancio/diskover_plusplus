<template>
  <v-container grid-list-lg class="grey lighten-4">
    <v-layout column>
      <v-flex xs12>
        <label>Name</label>
        <v-text-field
          placeholder="Name"
          color="black"
          v-model="name"
          :readonly="isReadOnly"
          :error="isReadOnly"
        />
      </v-flex>
      <v-flex xs12>
        <label>Category</label>
        <v-select
          :items="categories"
          placeholder="Category"
          color="black"
          :menu-props="{zIndex:'1001'}"
          v-model="category"
          :readonly="isReadOnly"
          :error="isReadOnly"
        />
      </v-flex>
      <v-flex xs12>
        <label>Description</label>
        <v-textarea
          v-model="description"
          color="black"
          auto-grow
          placeholder="Description"
          :readonly="isReadOnly"
          :error="isReadOnly"
        />
      </v-flex>
      <FormMapView
        height="300px"
        @click="handleMapClick"
        :defaultFormCoords="defaultCoords"
        :readonly="isReadOnly"
      />
      <v-flex xs12>
        <v-layout justify-space-between align-end class="pl-2">
          <label>LatLng (Click on the map to set):</label>
          <v-btn @click="resetMapView">Reset Map</v-btn>
        </v-layout>
        <v-text-field label="Coordinates" readonly :error="isReadOnly" :value="coords"/>
      </v-flex>

      <div id="subarea-select">
        <v-autocomplete
          v-model="subareaIds"
          :items="subareaItems"
          :search-input.sync="subareaSearch"
          @input="subareaSearch=null"
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
          :menu-props="{zIndex:'1001'}"
        />
      </div>
      <div id="subarea-select">
        <v-autocomplete
          v-model="mainBuildingId"
          :items="mainBuildingItems"
          :search-input.sync="mainBuildingSearch"
          @input="mainBuildingSearch=null"
          cache-items
          hide-selected
          auto-select-first
          clearable
          label="Main Buidling"
          placeholder="Search a main building"
          color="blue"
          :menu-props="{zIndex:'1001'}"
        />
      </div>

      <v-btn v-if="mode!='delete'" color="success" @click="handleSubmitClick()">Save Location</v-btn>
      <v-btn v-else color="error" @click="handleDeleteClick()">Delete Location</v-btn>
      <v-btn @click="handleCancelClick()">Cancel</v-btn>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      name: "",
      category: "",
      description: "",
      coords: [],
      subareaIds: [],
      mainBuildingId: -1,
      defaultCoords: this.$defaultStartCoords,
      subareaSearch: "",
      subareaItems: [],
      mainBuildingSearch: "",
      mainBuildingItems: []
    };
  },
  computed: {
    categories() {
      return this.$store.getters.categoryNames;
    },
    isReadOnly() {
      return this.mode == "delete" ? true : false;
    },
    id() {
      return this.$route.params.id;
    },
    mode() {
      return this.$route.params.mode;
    }
  },
  watch: {
    $route(newRoute, oldRoute) {
      this.handleRouteChange();
    },
    subareaSearch(newSearch) {
      this.apiGetSubareaItems(newSearch);
    },
    mainBuildingSearch(newSearch) {
      this.apiGetMainBuildingItems(newSearch);
    }
  },
  mounted() {
    this.handleRouteChange();
    this.coords = this.defaultCoords;
  },
  methods: {
    resetMapView() {
      this.$eventBus.$emit("reset-map-view", 15);
    },
    handleMapClick(newCoords) {
      this.coords = newCoords;
    },
    handleRouteChange() {
      this.apiGetSubareaItems("");
      this.apiGetMainBuildingItems("");
      if (this.mode == "update" || this.mode == "delete") {
        console.log("mode: ", this.mode);
        this.getUpdateData(this.id);
      }
    },
    getUpdateData(id) {
      this.$http
        .get(`/admin/locations/${id}`)
        .then(response => {
          console.log(
            "successful retrieved location update/delete data from API: ",
            response.data
          );
          let {
            name,
            category,
            description,
            lat,
            lng,
            subareas,
            main_building
          } = response.data;
          this.name = name;
          this.category = category;
          this.description = description;
          this.defaultCoords = [lat, lng];
          this.coords = [lat, lng];
          this.subareaIds = subareas;
          this.mainBuildingId = main_building;
          console.log(main_building)
        })
        .catch(error => {
          console.log(
            "error retrieving location update/delete data from API: ",
            error
          );
        });
    },
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
          console.log("successful got subarea items", response.data);
          this.subareaItems = response.data.map(sub => {
            return {
              text: sub.name,
              value: sub.id
            };
          });
        })
        // alert an error if unsuccessful GET
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error);
        })
        .finally(() => (this.isLoading = false));
    },
    apiGetMainBuildingItems(searchValue) {
      this.$http
        .get(`/admin/locations`, {
          params: {
            search: searchValue,
            category_ids: [1]
          },
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        .then(response => {
          console.log("successfully got mainBuilding items", response.data);
          this.mainBuildingItems = response.data.map(building => {
            return {
              text: building.name,
              value: building.id
            };
          });
        })
        // alert an error if unsuccessful GET
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error);
        })
        .finally(() => (this.isLoading = false));
    },

    handleCancelClick() {
      this.$router.go(-1);
    },
    handleSubmitClick() {
      if (this.mode == "create") {
        console.log("You are creating new location");
        this.postSubmittedData();
      } else {
        console.log("You are editting");
        this.patchSubmittedData();
      }
    },
    handleDeleteClick() {
      this.$http
        .delete(`/locations/${this.id}`)
        .then(response => {
          console.log("successfully deleted location from API", response);
          this.$router.push(`/map/search`);
        })
        .catch(function(error) {
          console.log("error deleting location to API", error);
        });
    },
    postSubmittedData() {
      this.$http
        .post(`/locations/`, {
          name: this.name,
          category: this.category,
          description: this.description,
          lat: this.coords[0],
          lng: this.coords[1],
          url: "/"
        })
        .then(response => {
          console.log("successfully posted new location to API", response);
          this.$router.push(`/map/details/${response.data.id}`);
        })
        .catch(function(error) {
          console.log("error posting new location to API", error);
        });
    },
    patchSubmittedData() {
      this.$http
        .patch(`/locations/${this.id}`, {
          name: this.name,
          category: this.category,
          description: this.description,
          lat: this.coords[0],
          lng: this.coords[1],
          url: "/"
        })
        .then(response => {
          console.log("successfully patched updated location to API", response);
          this.$router.push(`/map/details/${this.id}`);
        })
        .catch(function(error) {
          console.log("error patching updated location to API", error);
        });
    }
  }
};
</script>

<style>
label {
  font-weight: bold !important;
  font-size: 16px !important;
}

#subarea-select .v-chip {
  background-color: var(--v-primary-base) !important;
  color: white;
}
</style>
