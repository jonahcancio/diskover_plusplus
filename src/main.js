import Vue from 'vue'

//plugins
import '@/plugins/vuetify'
import '@/plugins/leaflet'
import "@/plugins/clamp.min"

//router
import Router from '@/router'

//store
import Store from '@/store'

//fonts and styles
import '@/assets/stylesheets/style.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

//components 
import '@/components/globalComponents'

//instance properties
import '@/vuePrototypes.js'

//App itself
import App from '@/App.vue'

Vue.config.productionTip = false

new Vue({
  store: Store,
  render: h => h(App),
  router: Router
}).$mount('#app')
