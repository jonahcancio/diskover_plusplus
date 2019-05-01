const L = window.L
const console = window.console

// map mixin can be used by any component that uses a leaflet map
export default {
  data() {
    return {
      jeepList: [
        {
          layer: L.layerGroup(),
          name: 'Ikot',
          color: 'orange',
          popup: '<b> Ikot Jeepney Route </b>',
          pointsKey: 'ikot'
        },
        {
          layer: L.layerGroup(),
          name: 'Toki',
          color: 'mediumorchid',
          popup: '<b> Toki Jeepney Route </b>',
          pointsKey: 'toki'
        },
        {
          layer: L.layerGroup(),
          name: 'Katipunan',
          color: 'firebrick',
          popup: '<b> Katipunan Jeepney Route </b>',
          pointsKey: 'katip'
        },
        {
          layer: L.layerGroup(),
          name: 'PHILCOA/Pantranco/SM North EDSA',
          color: 'green',
          popup: '<b> PHILCOA/Pantranco/SM North EDSA/<br> Jeepney Route </b>',
          pointsKey: 'green'
        }
      ],
    }
  },
  mounted() {
    if (this.map) {
      this.initJeepRoutes()
      this.initJeepRoutesControl()
    } else {
      console.log("No map to place jeepneys on")
    }
  },
  methods: {
    initJeepRoutesControl() {
      let overlays = {};
      for (let jeep of this.jeepList) {
        overlays[jeep.name] = jeep.layer
      }
      let control = L.control.layers({}, overlays,
        {
          position: 'bottomleft',
          collapsed: false
        }
      ).addTo(this.map)

      this.map.on("click", () => {
        control.collapse();
      })
    },

    initJeepRoutes() {
      for (let jeep of this.jeepList) {
        let jeepRoute = new L.Polyline(this.$jeepPoints[jeep.pointsKey], {
          color: jeep.color,
          weight: 2,
          opacity: 1,
          smoothFactor: 1
        });

        jeepRoute.bindPopup(jeep.popup);
        jeepRoute.addTo(jeep.layer);

        let jeepDecor = L.polylineDecorator(jeepRoute, {
          patterns: [
            {
              offset: 0,
              repeat: 50,
              symbol: L.Symbol.arrowHead({ pixelSize: 8, polygon: false, pathOptions: { stroke: true, color: jeep.color } })
            }
          ]
        });

        jeepDecor.bindPopup(jeep.popup);
        jeepDecor.addTo(jeep.layer);
        jeep.layer.addTo(this.map);
      }
    },
  }
}