<template>
  <v-layout column wrap class="pb-4">
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
    <v-flex class="mt-2 title text-xs-center">
      Category:
      <router-link
        :to="{path:'/map/search', query:{category:locationObj.category}}"
      >{{ locationObj.category }}</router-link>
    </v-flex>
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
        <v-tab v-for="(tab, i) in tabList1" :key="i">
          <v-layout column>
            <v-icon>{{ tab.icon }}</v-icon>
            <div>{{tab.label}}</div>
          </v-layout>
        </v-tab>
        <v-tab-item>
          <DirectionsTabItem/>
        </v-tab-item>
        <v-tab-item>
          <ImagesTabItem/>
        </v-tab-item>
        <v-tab-item>
          <DescriptionTabItem/>
        </v-tab-item>
      </v-tabs>
    </v-flex>
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
        <v-tab v-for="(tab, i) in tabList2" :key="i">
          <v-layout column>
            <v-icon>{{ tab.icon }}</v-icon>
            <div>{{tab.label}}</div>
          </v-layout>
        </v-tab>
        <v-tab-item>
          <NearbyLocationsTabItem/>
        </v-tab-item>
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
      locationObj: {},
      defaultThumbnail: require("@/assets/no-thumbnail.jpg"),
      currentTab1: 0,
      currentTab2: 0,
      tabList1: [
        { label: "Directions", icon: "directions" },
        { label: "Images", icon: "collections" },
        { label: "Description", icon: "description" }
      ]
    };
  },
  computed: {
    locationId() {
      return Number(this.$route.params.locationId);
    },
    thumbnailUrl() {
      return this.$store.getters["details/fullImageUrls"][0];
    },
    tabList2() {
      let tabList2 = [{ label: "Nearby Locations", icon: "directions_walk" }];
      if (this.locationObj.category == "College Buildings") {
        tabList2.push({ label: "Rooms Inside", icon: "meeting_room" });
      } else if (this.locationObj.category == "Rooms") {
        tabList2.push({ label: "Outer Building", icon: "location_city" });
      }
      return tabList2;
    },
    showRoomBuilding() {
      return this.locationObj.category == "College Buildings" || this.locationObj.category == "Rooms"
    }
  },
  created() {
    this.apiGetLocationData();
  },
  watch: {
    $route() {
      this.apiGetLocationData();
      this.currentTab1 = this.currentTab2 = 0;
    }
  },
  methods: {
    apiGetLocationData() {
      if (this.locationId) {
        this.$http
          .get(`${this.$backendApiPath}location/${this.locationId}`)
          .then(response => {
            console.log("Succesfully received location details from API");
            console.log(response.data);
            this.locationObj = response.data;
            let { lat, lng } = response.data;
            this.$store.commit(
              "details/setDescription",
              response.data.description
            );
            this.$store.commit("details/setEndCoords", [lat, lng]);
            this.$store.commit("details/setImageUrls", response.data.img_urls);
            this.$store.commit(
              "details/setInsideRooms",
              response.data.inside_rooms
            );
            this.$store.commit(
              "details/setNearbyLocations",
              response.data.nearby_locations
            );
            this.$store.commit("details/setOuterBuilding", response.data.outer_building)
            console.log("endCoords from API have been stored");
          })
          .catch(error => {
            console.log("Error receiving location details from API");
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
