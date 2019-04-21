<template>
  <!-- Show details of a specific location on the side drawer -->
  <v-layout column wrap class="pb-4">
    <!-- Thumbnail/Cover Image -->
    <v-flex xs12>
      <v-card :img="thumbnailUrl" :height="200">
        <v-layout fill-height align-end justify-center>
          <v-flex>
            <v-card-title primary-title class="d-block semi-dark-bg">
              <div class="headline white--text text-xs-center">{{ locationObj.name }}</div>
            </v-card-title>
          </v-flex>
        </v-layout>
      </v-card>
    </v-flex>
    <!-- Category indicator and link -->
    <v-flex class="mt-2 title text-xs-center">
      Category:
      <router-link
        :to="{path:'/map/search', query:{category: locationObj.category}}"
      >{{ locationObj.category }}</router-link>
    </v-flex>
    <v-flex class="mt-2 title text-xs-left">
      Tags:
      <span v-if="!tags.length">None</span>
      <div v-else>
        <router-link v-for="(tag, i) in tags" :key="i" :to="{path:'/map/search', query:{tag: tag}}">
          <v-chip color="primary" dark>{{tag}}</v-chip>
        </router-link>
      </div>
    </v-flex>
    <!-- Primary detais tab -->
    <v-flex class="mt-3">
      <v-tabs
        v-model="primaryTabIndex"
        color="primary"
        slider-color="secondary"
        dark
        centered
        grow
        max="400px"
      >
        <!-- primary details tab navigation -->
        <v-tab v-for="(tab, i) in tabList1" :key="i">
          <v-layout column>
            <v-icon>{{ tab.icon }}</v-icon>
            <div>{{tab.label}}</div>
          </v-layout>
        </v-tab>
        <!-- Directions Tab -->
        <v-tab-item>
          <DirectionsTabItem/>
        </v-tab-item>
        <!-- Images Tab -->
        <v-tab-item>
          <ImagesTabItem/>
        </v-tab-item>
        <!-- Description Tab -->
        <v-tab-item>
          <DescriptionTabItem/>
        </v-tab-item>
      </v-tabs>
    </v-flex>
    <v-flex class="my-3" v-if="hasSubareas">
      <!-- <v-tabs
        color="primary"
        slide-color="secondary"
        dark
        v-model="subareaTabIndex"
        centered
        grow
        max="400px"
        show-arrows
      >
        <v-tab v-for="(subs, category, i) in subareas" :key="i">{{ category }}</v-tab>
          <v-tab-item v-for="(subs, category, i) in subareas" :key="i">
            <SubareaTabItem :subareas="subs" :label="category"/>
          </v-tab-item>
      </v-tabs>-->
      <v-expansion-panel v-model="subareaTabIndex" id="subarea-panels">
        <v-expansion-panel-content v-for="(subs, category, i) in subareas" :key="i">
          <template v-slot:header>
            <div>{{category}}</div>
          </template>
          <SubareaTabItem :subareas="subs" :label="category"/>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-flex>
    <v-flex class="mt-2" v-if="hasMainBuilding">
      <v-tabs color="primary" slide-color="secondary" dark centered>
        <v-tab>
          <v-layout column>
            <v-icon>location_city</v-icon>
            <div>Main Building</div>
          </v-layout>
        </v-tab>
        <v-tab-item>
          <MainBuildingTabItem :building="mainBuilding"/>
        </v-tab-item>
      </v-tabs>
    </v-flex>
    <v-flex class="mt-2">
      <v-tabs color="primary" slide-color="secondary" dark centered>
        <v-tab>
          <v-layout column>
            <v-icon>directions_walk</v-icon>
            <div>Nearby Locations</div>
          </v-layout>
        </v-tab>
        <v-tab-item>
          <NearbyLocationsTabItem/>
        </v-tab-item>
      </v-tabs>
    </v-flex>
    <v-layout 
      v-if="isLoggedIn"
      align-space-around class="mt-4" column
    >
      <v-layout justify-space-around>
      <v-btn 
        dark color="blue" 
        :to="{
          name: 'location_crud_form',
          params: {
            mode: 'update',
            id:locationId
          }
        }"      
      >
        Update Info 
      </v-btn>
      <v-btn 
        dark color="blue" 
        :to="{
          name: 'location_images_form',
          params: {
            id: locationId
          }
        }"      
      >
        Update Images
      </v-btn>
      </v-layout>
      <v-btn color="error"
         :to="{
          name: 'location_crud_form',
          params: {
            mode: 'delete',
            id:locationId
          }
        }"  
      >
        Delete
      </v-btn>
    </v-layout>
  </v-layout>
</template>

<script>
export default {
  created() {
    // fetches location data into locationObj
    this.apiGetLocationData();
  },
  data() {
    return {
      // object contains all details of object
      locationObj: {},
      // default thumbnail img-url
      defaultThumbnail: require("@/assets/no-thumbnail.jpg"),
      // index of primary details tabs
      primaryTabIndex: 0,
      // index of related details tabs
      subareaTabIndex: 0,
      // list of tabs used for primary details tab navigation
      tabList1: [
        { label: "Directions", icon: "directions" },
        { label: "Images", icon: "collections" },
        { label: "Description", icon: "description" }
      ]
    };
  },
  computed: {
    // returns the location id based on route
    locationId() {
      return Number(this.$route.params.id);
    },
    // returns the the first img-url in the location as the thumbnail url
    thumbnailUrl() {
      return this.$store.getters["details/fullImageUrls"][0];
    },
    tags() {
      return this.$store.state.details.tags;
    },
    subareas() {
      return this.$store.state.details.subareas;
    },
    hasSubareas() {
      return this.$store.getters["details/hasSubareas"];
    },
    mainBuilding() {
      return this.$store.state.details.mainBuilding;
    },
    hasMainBuilding() {
      return this.$store.getters["details/hasMainBuilding"];
    },
    isLoggedIn() {
      return this.$store.getters["auth/isLoggedIn"];
    }
  },
  watch: {
    $route() {
      // refetch location data into locationObj
      this.apiGetLocationData();
      // reset both tab-indexes to first tab
      this.primaryTabIndex = this.subareaTabIndex = 0;
    }
  },
  methods: {
    // calls HTTP GET request for retrieving details of the location at locationId
    apiGetLocationData() {
      if (this.locationId) {
        this.$http
          .get(`/locations/${this.locationId}`)
          // stores location data to the details module of Vuex Store if GET successful
          .then(response => {
            console.log(response);
            this.locationObj = response.data;
            let { lat, lng } = response.data;
            this.$store.commit("details/setCategory", response.data.category);
            this.$store.commit("details/setTags", response.data.tags);
            this.$store.commit(
              "details/setDescription",
              response.data.description
            );
            this.$store.commit("details/setEndCoords", [lat, lng]);
            this.$store.commit("details/setImageUrls", response.data.img_urls);
            this.$store.commit("details/setSubareas", response.data.subareas);
            this.$store.commit(
              "details/setNearbyLocations",
              response.data.nearby_locations
            );
            this.$store.commit(
              "details/setMainBuilding",
              response.data.main_building
            );
          })
          // alerts error and resets Vuex Store coordinates if GET unsuccessful
          .catch(error => {
            Alert("Error receiving location details from API");
            this.$store.commit("details/setEndCoords", []);
            console.log(error);
          });
      }
    }
  }
};
</script>

<style>
.semi-dark-bg {
  background-color: rgba(0, 0, 0, 0.7);
}

#subarea-panels .v-expansion-panel__header {
  background-color: var(--v-primary-base) !important;
  color: white;
}
</style>
