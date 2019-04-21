<template>
  <v-container class="grey lighten-4">
    <v-layout class="py-4" column>
      <v-flex xs12>
        <div class="title">Search an image to delete via its location</div>
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
      {{ selectedDeleteImageId }}
      <v-flex xs12>
        <v-radio-group v-model="selectedDeleteImageId">
          <div v-for="image in locationSearchImages" :key="image.id">
            <v-radio :value="image.id" color="primary">
              <div slot="label">
                <div>{{ image.img_url }}</div>
                <v-img :src="getFullImageUrl(image.img_url)" height="150px" contain/>
              </div>
            </v-radio>
          </div>
        </v-radio-group>
      </v-flex>
      <v-btn color="error" @click="handleDeleteClick()">Delete Image</v-btn>
      <v-btn @click="handleCancelClick()">Cancel</v-btn>
    </v-layout>
    <CenterModal :isVisible="isDeleteConfirmVisible" @close="isDeleteConfirmVisible=false">
      <v-layout column align-content-space-around class="red lighten-4 text-xs-center">
        <v-flex class="headline py-3">Are you sure you want to delete {{selectedDeleteImageName}}?</v-flex>
        <v-flex class="title pt-2">
          <v-img :src="getFullImageUrl(selectedDeleteImageName)" height="200px" contain/>
        </v-flex>
        <v-layout justify-center>
          <v-btn color="blue" dark @click="handleDeleteConfirm">Yes</v-btn>
          <v-btn color="red" dark @click="isDeleteConfirmVisible=false">No</v-btn>
        </v-layout>
      </v-layout>
    </CenterModal>
  </v-container>
</template>

<script>
import AdminVerifierMixin from "@/mixins/AdminVerifierMixin"

export default {
  mixins: [AdminVerifierMixin],
  created() {
    this.handleRouteChange();
  },
  data() {
    return {
      locationSearchId: -1,
      locationSearchQuery: "",
      locationSearchItems: [],
      locationSearchImages: [],
      selectedDeleteImageId: "",
      isDeleteConfirmVisible: false
    };
  },
  computed: {
    locationSearchItemsWithUnbinded() {
      return [
        ...this.locationSearchItems,
        { text: "Unbinded", value: 0 },
        { text: "None", value: -1 }
      ];
    },
    selectedDeleteImageName() {
      let image = this.locationSearchImages.find(
        item => item.id == this.selectedDeleteImageId
      )
      return image? image.img_url : null;
    }
  },
  methods: {
    handleRouteChange() {
      this.apiGetLocationSearchItems("");
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
      this.selectedDeleteImageId = null;
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
    handleDeleteClick() {
      this.isDeleteConfirmVisible = true;
    },
    handleDeleteConfirm() {
      this.$http
        .delete(`/admin/images/${this.selectedDeleteImageId}/`)
        .then(response => {
          console.log("successfully deleted location from API", response);
          this.$router.go();
        })
        .catch(function(error) {
          console.log("error deleting location to API", error);
        });
    },
    handleCancelClick() {
      console.log("cancel");
      this.$router.go(-1);
    }
  }
};
</script>

<style>
</style>
