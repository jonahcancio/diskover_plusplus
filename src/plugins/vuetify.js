import Vue from 'vue'
import Vuetify from 'vuetify/lib'
import 'vuetify/src/stylus/app.styl'

// configure Vuetify
Vue.use(Vuetify, {
  iconfont: 'md',
  // setup up color scheme
  theme: {
    primary: "#D32F2F", // darkish red
    secondary: "#FFEBEE", // light pink
    accent: "#FFCDD2", // pink
  },
  // allow color scheme to be referenced by css variables in style.css
  options: {
    customProperties: true,
  }
})
