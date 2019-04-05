import Axios from "axios"
import Vue from 'vue'

Axios.defaults.baseURL = process.env.VUE_APP_API_URL

// Axios used for http requesting to backend api
// can be accessed via this.$http
Vue.prototype.$http = Axios
