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
      defaultCoords: this.$defaultStartCoords
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
    }
  },
  mounted() {
		this.handleRouteChange();
		this.coords = this.defaultCoords
  },
  methods: {
    resetMapView() {
      this.$eventBus.$emit("reset-map-view", 15);
    },
    handleMapClick(newCoords) {
      this.coords = newCoords;
    },
    handleRouteChange() {
      if (this.mode == "update" || this.mode == "delete") {
        console.log("mode: ", this.mode);
        this.getUpdateData(this.id);
      }
    },
    getUpdateData(id) {
      this.$http
        .get(`${this.$backendApiPath}location/${id}`)
        .then(response => {
          console.log(
            "successful retrieved location update/delete data from API: ",
            response.data
          );
          let { name, category, description, lat, lng } = response.data;
          this.name = name;
          this.category = category;
          this.description = description;
          this.defaultCoords = [lat, lng];
          this.coords = [lat, lng];
        })
        .catch(error => {
          console.log(
            "error retrieving location update/delete data from API: ",
            error
          );
        });
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
        .delete(`${this.$backendApiPath}location/${this.id}`)
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
        .post(`${this.$backendApiPath}location`, {
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
        .patch(`${this.$backendApiPath}location/${this.id}`, {
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

<style scoped>
label {
  font-weight: bold !important;
  font-size: 16px !important;
}
</style>
