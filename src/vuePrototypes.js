// This file sets up all the global constants that can be accessed by every Vue component
// Each component need only call this.$<constant> to access it:
// e.g. Vue.prototype.$http accessed as this.$http

import Vue from 'vue'
import Axios from "axios"
import qs from "qs"

// querystring parser for get requests
Vue.prototype.$qs = qs
// Axios used for http requesting to backend api
// can be accessed via this.$http
Vue.prototype.$http = Axios

// for debugging, find out the base url where css and js files are stored
Vue.prototype.$publicPath = process.env.BASE_URL

// backend api path that this.$http will send requests to
Vue.prototype.$backendApiPath = process.env.VUE_APP_API_URL
// static api path that will prepend image urls to gain access to image in server
Vue.prototype.$backendStaticPath = process.env.VUE_APP_STATIC_URL

// shared eventBus used to modulate events between faraway components
Vue.prototype.$eventBus = new Vue()

// default coordinates of UP Oblation used for resetting the map
Vue.prototype.$defaultStartCoords = [14.655004131234529, 121.06428197779681]
// default bounding box containing UP Diliman used for resetting the map
Vue.prototype.$defaultUpBoundingBox = [
  [14.646712309301837, 121.07661789894301],
  [14.665232770030423, 121.05537526614295]
]

export default Vue;