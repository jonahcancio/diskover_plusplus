const L = window.L
const console = window.console

// map mixin can be used by any component that uses a leaflet map
export default {
  props: {
    // allow parent component to specify height of map
    height: {
      type: String,
      default: "60vh"
    },
    // allow parent component to specify id of DOM element to render map on
    mapId: {
      type: String,
      default: "map"
    }
  },
  data() {
    return {
      // store circles on map
      circleGroup: {},
      // store the zoom control button on map
      zoomControl: {},
      // store the map itself
      map: {},
      // store the markers on map
      markerGroup: {},
      // store the default UP Oble coordinates
      defaultCoords: this.$defaultStartCoords,
      // store the reset control button on map
      resetButton: {},
      // store the icon used to mark the origin "start" location
      originIcon: {},
    }
  },
  // called when DOM elements are ready for map to be binded upon
  mounted() {
    // initialize map
    this.initMap()
    // initilize originIcon
    this.originIcon = this.getIcon(require("@/assets/markers/originIcon.png"))
  },
  methods: {
    // initializes map on element with id mapId and configure the parameters (references and tokens) used
    // places control buttons in default positions and adds a feature where coordinates are logged to console
    // when clicking anywhere on map
    initMap() {
      this.map = L.map(this.mapId, {
        zoomControl: false,
      }).setView(this.defaultCoords, 15)

      // add tilelayer with valid accessToken that must be acquired from https://account.mapbox.com/access-tokens/
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
          '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
          'Imagery &copy; <a href="https://www.mapbox.com/">Mapbox</a>, ' +
          'Routing license &copy; <a href="https://opendatacommons.org/licenses/odbl/">ODbL</a>, ' +
          'Routing source &copy; <a href="http://project-osrm.org/">OSRM</a>',
        zoom: 16,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoiZGlza292ZXJwbHVzcGx1cyIsImEiOiJjanRucm1kaHQwMGZqNGFtcjNkbWwyODl3In0.AQ4D4e0LYZRUNHj6t4NPhw'
      }).addTo(this.map)

      // log coordinates to console on click
      this.map.on("click", e => {
        console.log("You clicked on ", e.latlng)
      })
      this.zoomControl = L.control.zoom({
        position: "bottomright"
      }).addTo(this.map)
      this.markerGroup = L.layerGroup().addTo(this.map)
      this.circleGroup = L.layerGroup().addTo(this.map)
    },
    // initialize reset button to rezoom the map back to UP Oble
    initResetButton() {
      this.resetButton = L.easyButton({
        position: 'bottomright',
        states: [{
          icon: '<i class="material-icons">refresh</i>',
          onClick: () => {
            this.$store.commit("map/setOriginCoords", [...this.$defaultStartCoords])
            this.map.fitBounds(this.$defaultUpBoundingBox)
          }
        }]
      }).addTo(this.map)
    },
    // add a marker to map at coords, with optional options and popupText parameters
    addMarker(coords, options, popupText) {
      if (this.markerGroup) {
        let m = L.marker(coords, options).addTo(this.markerGroup)
        if (popupText) {
          m.bindPopup(popupText).openPopup()
        }
        return m
      } else {
        console.log("error: markerGroup not initialized yet")
        return null
      }
    },
    // remove all markers on map
    removeAllMarkers() {
      if (this.markerGroup) {
        this.markerGroup.clearLayers()
      } else {
        console.log("error: markerGroup not initialized yet")
      }
    },
    // add a marker to map at coords, with optional options
    addCircle(coords, options) {
      if (this.circleGroup) {
        L.circle(coords, options).addTo(this.circleGroup);
      } else {
        console.log("addCircle error: circleGroup not initialized yet");
      }
    },
    // remove all circles on map
    removeAllCircles() {
      if (this.circleGroup) {
        this.circleGroup.clearLayers();
      } else {
        console.log("removeCircle error: circleGroup not initialized yet");
      }
    },
    // rezoom map to fit all markers
    fitAllMapView() {
      this.map.fitBounds(this.markerGroup.getBounds());
    },
    getIcon(iconUrl) {
      return iconUrl ? L.icon({
        iconUrl: iconUrl,
        shadowUrl: require("@/assets/markers/shadow.png"),
        iconSize: [25, 41],
        iconAnchor: [12, 41],
        popupAnchor: [1, -34],
        shadowSize: [41, 41]
      }) : null
    }
  }
}