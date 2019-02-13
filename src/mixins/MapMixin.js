const L = window.L
const console = window.console

export default {
  props: {
    height: {
      type: String,
      default: "60vh"
    }
  },
  data() {
    return {
      circleGroup: {},
      zoomControl: {},
      map: {},
      markerGroup: {},
      defaultCoords: this.$defaultStartCoords,
      resetButton: {},
      originIcon: {},
    }
  },
  mounted() {
    this.initMap()
    console.log("Mixin: MAP INITIALIZED")
    this.originIcon = L.icon({
      iconUrl: require("@/assets/markers/originIcon.png"),
      shadowUrl: require("@/assets/markers/shadow.png"),
      iconSize: [25, 41],
      iconAnchor: [12, 41],
      popupAnchor: [1, -34],
      shadowSize: [41, 41]
    })
  },
  methods: {
    initMap() {
      this.map = L.map('map', {
        zoomControl: false,
      }).setView(this.defaultCoords, 15)
      L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery &copy; <a href="https://www.mapbox.com/">Mapbox</a>, ' +
        'Routing license &copy; <a href="https://opendatacommons.org/licenses/odbl/">ODbL</a>, ' +
        'Routing source &copy; <a href="http://project-osrm.org/">OSRM</a>',
        zoom: 16,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1Ijoiam9uYWhjYW5jaW8iLCJhIjoiY2pwcDd4d2c3MDRrczQ5cWxxdjdiZmF0ZiJ9.kXkc1Xcm8M1JDvapymztEw'
      }).addTo(this.map)
      this.map.on("click", e => {
        console.log("You clicked on ", e.latlng)
      })
      this.zoomControl = L.control.zoom({
        position: "bottomright"
      }).addTo(this.map)
      this.markerGroup = L.layerGroup().addTo(this.map)
      this.circleGroup = L.layerGroup().addTo(this.map)
    },
    initResetButton() {
      this.resetButton = L.easyButton({
        position: 'bottomright',
        states: [{
          icon: '<i class="material-icons">refresh</i>',
          onClick: () => {
            this.currentCoords = [...this.$defaultStartCoords]
            this.map.fitBounds(this.$defaultUpBoundingBox)
          }
        }]
      }).addTo(this.map)
    },
    addMarker(coords, options, popupText) {
      if (this.markerGroup) {
        let m = L.marker(coords, options).addTo(this.markerGroup)
        if(popupText) {
          m.bindPopup(popupText).openPopup()
        }
      } else {
        console.log("error: markerGroup not initialized yet")
      }
    },
    removeAllMarkers() {
      if (this.markerGroup) {
        this.markerGroup.clearLayers()
      } else {
        console.log("error: markerGroup not initialized yet")
      }
    },
    addCircle(coords, options) {
      if (this.circleGroup) {
        L.circle(coords, options).addTo(this.circleGroup);
      } else {
        console.log("addCircle error: circleGroup not initialized yet");
      }
    },
    removeAllCircles() {
      if (this.circleGroup) {
        this.circleGroup.clearLayers();
      } else {
        console.log("removeCircle error: circleGroup not initialized yet");
      }
    },
    fitAllMapView() {
      this.map.fitBounds(this.markerGroup.getBounds());
    }
  }
}