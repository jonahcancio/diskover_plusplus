<template>
  <!-- Used to handle Web page requests that do not exist -->
  <v-container class="grey lighten-4">
    <v-layout class="py-4" column>
      <v-flex xs12 class="display-1">
        <div class="mb-4">
          Update images binded to
          <span class="display-2 primary--text">{{ locationName }}</span>
        </div>
      </v-flex>
      <v-flex xs12>
        <div class="title">Images currently binded to location</div>
        <div v-for="image in bindedImages" :key="image.id">
          <v-checkbox v-model="selectedBindedImages" :value="image.id" color="primary">
            <div slot="label">
              <div>{{ image.img_url }}</div>
              <v-img :src="getFullImageUrl(image.img_url)" height="150px"/>
            </div>
          </v-checkbox>
        </div>
      </v-flex>
      <v-flex xs12>
        <div class="title">Add images binded to other locations</div>
        <div class="maroon-chips">
          <v-autocomplete
            v-model="locationSearchId"
            :items="locationSearchItemsWithUnbinded"
            :search-input.sync="locationSearchQuery"
            @input="apiGetLocationSearchImages"
            cache-items
            hide-selected
            auto-select-first
            clearable
            label="Location Search"
            placeholder="Search images from a location"
            :menu-props="{zIndex:'1001'}"
          />
        </div>
      </v-flex>
      <v-flex xs12>
        <div v-for="image in locationSearchImages" :key="image.id">
          <v-checkbox v-model="selectedSearchImages" :value="image.id" color="primary">
            <div slot="label">
              <div>{{ image.img_url }}</div>
              <v-img :src="getFullImageUrl(image.img_url)" height="150px"/>
            </div>
          </v-checkbox>
        </div>
      </v-flex>
      <v-flex xs12>
        <div class="title">Upload images</div>
        <input type="file" ref="imageFiles" multiple @input="handleImageUploads">
      </v-flex>
      <v-btn color="success" @click="handleUpdateClick()">Update location images</v-btn>
      <v-btn @click="handleCancelClick()">Cancel</v-btn>
    </v-layout>
  </v-container>
</template>


<script>
export default {
  created() {
    this.handleRouteChange();
  },
  data() {
    return {
      locationName: "",
      bindedImages: [],
      selectedBindedImages: [],
      locationSearchId: -1,
      locationSearchItems: [],
      locationSearchQuery: "",
      locationSearchImages: [],
      selectedSearchImages: [],
      uploadedImageFiles: []
    };
  },
  computed: {
    locationId() {
      return this.$route.params.id;
    },
    locationSearchItemsWithUnbinded() {
      return [
        ...this.locationSearchItems,
        { text: "Unbinded", value: 0 },
        { text: "None", value: -1 }
      ];
    },
    updatedImageIds() {
      return [...this.selectedBindedImages, ...this.selectedSearchImages];
    }
  },
  watch: {
    $route() {
      this.handleRouteChange();
    }
  },
  methods: {
    handleRouteChange() {
      this.apiGetLocationToUpdateImages(this.locationId);
      this.apiGetLocationSearchItems("");
    },
    apiGetLocationToUpdateImages(id) {
      this.$http
        .get(`/admin/locations/images/${id}`)
        .then(response => {
          console.log(
            "successful retrieved images data from API: ",
            response.data
          );
          this.locationName = response.data.name;
          this.bindedImages = response.data.images;
          this.selectedBindedImages = response.data.images.map(
            image => image.id
          );
        })
        .catch(error => {
          console.log(
            "error retrieving location update/delete data from API: ",
            error
          );
        });
    },
    apiGetLocationSearchItems(searchValue) {
      this.$http
        .get(`/admin/locations/`, {
          params: {
            search: searchValue
          },
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        .then(response => {
          this.locationSearchItems = response.data.map(loc => {
            return {
              text: loc.name,
              value: loc.id
            };
          });
        })
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error);
        });
    },
    apiGetLocationSearchImages() {
      this.locationSearchQuery = null;
      this.selectedSearchImages = [];
      if (!this.locationSearchId && this.locationSearchId != 0) {
        this.locationSearchId = -1;
      }
      this.$http
        .get(`/admin/images/`, {
          params: {
            location_id: this.locationSearchId
          },
          paramsSerializer: params => {
            return this.$qs.stringify(params, { indices: false });
          }
        })
        .then(response => {
          console.log(
            "successful retrieved location search images data from API: ",
            response.data
          );
          this.locationSearchImages = response.data;
        })
        // alert an error if unsuccessful GET
        .catch(error => {
          alert("error receiving queried results from API: ");
          console.log(error);
        });
    },
    getFullImageUrl(imgUrl) {
      return `${this.$backendStaticPath}images/locations/${imgUrl}`;
    },
    handleImageUploads() {
      const imageFiles = this.$refs.imageFiles.files;
      console.log("BOOM", imageFiles);
      this.uploadedImageFiles = [];
      for (let i = 0; i < imageFiles.length; i++) {
        this.uploadedImageFiles.push(imageFiles[i]);
      }
    },
    handleUpdateClick() {
      let formData = new FormData();
      for (let imageId of this.updatedImageIds) {
        formData.append("image_ids", imageId);
      }
      for (let imageFile of this.uploadedImageFiles) {
        formData.append("images", imageFile);
      }
      console.log(formData);
      this.$http
        .patch(`/admin/locations/images/${this.locationId}/`, formData, {
          headers: {
            "Content-Type": "multipart/form-data"
          }
        })
        .then(response => {
          console.log("successfully patched updated location to API", response);
        })
        .catch(function(error) {
          console.log("error patching updated location to API", error);
        });
      this.$router.go();
    },
    handleCancelClick() {
      console.log("cancel");
      this.$router.go();
    }
  }
};
</script>

<style>
</style>
