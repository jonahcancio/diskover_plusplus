import Vue from 'vue'

// JS plugins
import '@/plugins/vuetify'
import '@/plugins/leaflet'
import "@/plugins/clamp.min"
import '@/plugins/axios'

// Vue router
import Router from '@/router'

// Vuex store
import Store from '@/store'

// fonts and styles
import '@/assets/stylesheets/style.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

// Vue components 
import '@/components/globalComponents'

// instance properties
import '@/vuePrototypes.js'

// App itself
import App from '@/App.vue'

Vue.config.productionTip = false

// create Vue instance
new Vue({
  store: Store,
  render: h => h(App),
  router: Router
}).$mount('#app')
