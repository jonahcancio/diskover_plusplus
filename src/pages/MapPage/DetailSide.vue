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
        :to="{path:'/map/search', query:{category:locationObj.category}}"
      >
        {{ locationObj.category }}
      </router-link>
    </v-flex>
    <!-- Primary detais tab -->
    <v-flex class="mt-3">
      <v-tabs
        v-model="currentTab1"
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
    <!-- Related detais tab --> 
    <v-flex class="mt-3">
      <v-tabs
        v-model="currentTab2"
        color="primary"
        slider-color="secondary"
        dark
        centered
        grow
        max="400px"
      >
        <!-- related details tab navigation -->
        <v-tab v-for="(tab, i) in tabList2" :key="i">
          <v-layout column>
            <v-icon>{{ tab.icon }}</v-icon>
            <div>{{tab.label}}</div>
          </v-layout>
        </v-tab>
        <!-- Nearby Locations Tab -->
        <v-tab-item>
          <NearbyLocationsTabItem/>
        </v-tab-item>
        <!-- Rooms and Building Tab -->
        <v-tab-item v-if="showRoomBuilding">
          <RoomBuildingTabItem/>
        </v-tab-item>
      </v-tabs>
    </v-flex>
    <!-- <v-layout justify-space-around class="mt-4">
      <v-btn dark color="blue" :to="`/form/update/${locationId}`">Update</v-btn>
      <v-btn color="error" :to="`/form/delete/${locationId}`">Delete</v-btn>
    </v-layout>-->
  </v-layout>
</template>

<script>
export default {
  data() {
    return {
      // object contains all details of object
      locationObj: {},
      // default thumbnail img-url
      defaultThumbnail: require("@/assets/no-thumbnail.jpg"),
      // index of primary details tabs
      currentTab1: 0,
      // index of related details tabs
      currentTab2: 0,
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
      return Number(this.$route.params.locationId);
    },
    // returns the the first img-url in the location as the thumbnail url
    thumbnailUrl() {
      return this.$store.getters["details/fullImageUrls"][0];
    },
    // list of tabs used for related details tab navigation
    tabList2() {
      let tabList2 = [{ label: "Nearby Locations", icon: "directions_walk" }];
      if (this.locationObj.category == "College Buildings") {
        tabList2.push({ label: "Rooms Inside", icon: "meeting_room" });
      } else if (this.locationObj.category == "Rooms") {
        tabList2.push({ label: "Outer Building", icon: "location_city" });
      }
      return tabList2;
    },
    // returns true if location is a building or room and a separate Building Room tab
    showRoomBuilding() {
      return this.locationObj.category == "College Buildings" || this.locationObj.category == "Rooms"
    }
  },
  created() {
    // fetches location data into locationObj
    this.apiGetLocationData();
  },
  watch: {
    $route() {
      // refetch location data into locationObj
      this.apiGetLocationData();
      // reset both tab-indexes to first tab
      this.currentTab1 = this.currentTab2 = 0;
    }
  },
  methods: {
    // calls HTTP GET request for retrieving details of the location at locationId
    apiGetLocationData() {
      if (this.locationId) {
        this.$http
          .get(`${this.$backendApiPath}location/${this.locationId}`)
          // stores location data to the details module of Vuex Store if GET successful
          .then(response => {
            this.locationObj = response.data;
            let { lat, lng } = response.data;
            this.$store.commit("details/setDescription", response.data.description);
            this.$store.commit("details/setEndCoords", [lat, lng]);
            this.$store.commit("details/setImageUrls", response.data.img_urls);
            this.$store.commit("details/setInsideRooms", response.data.inside_rooms);
            this.$store.commit("details/setNearbyLocations", response.data.nearby_locations);
            this.$store.commit("details/setOuterBuilding", response.data.outer_building);
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

<style scoped>
.semi-dark-bg {
  background-color: rgba(0, 0, 0, 0.7);
}
</style>
