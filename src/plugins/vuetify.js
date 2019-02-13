import Vue from 'vue'
import Vuetify from 'vuetify/lib'
import 'vuetify/src/stylus/app.styl'

Vue.use(Vuetify, {
  iconfont: 'md',
  theme: {
    primary: "#D32F2F",
    secondary: "#FFEBEE",
    accent: "#FFCDD2",
    error: "#B71C1C",
    warning: "#ffeb3b",
    info: "#2196f3",
    success: "#4caf50"
  },
  options: {
    customProperties: true,
  }
})
