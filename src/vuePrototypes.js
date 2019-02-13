import Vue from 'vue'
import Axios from "axios"
import qs from "qs"

Vue.prototype.$qs = qs
Vue.prototype.$http = Axios
Vue.prototype.$publicPath = process.env.BASE_URL
// Vue.prototype.$backendApiPath = "https://fake-api-1.herokuapp.com/"
// Vue.prototype.$backendApiPath = "http://localhost:8000/"
// Vue.prototype.$backendStaticPath = "http://localhost:8000/static/"

Vue.prototype.$backendApiPath = process.env.VUE_APP_API_URL
Vue.prototype.$backendStaticPath = process.env.VUE_APP_STATIC_URL

Vue.prototype.$eventBus = new Vue()
Vue.prototype.$defaultStartCoords = [14.655004131234529, 121.06428197779681]
Vue.prototype.$defaultUpBoundingBox = [
  [14.646712309301837, 121.07661789894301],
  [14.665232770030423, 121.05537526614295]
]