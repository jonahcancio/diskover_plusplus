if(process.env.NODE_ENV === 'production') {
  process.env.VUE_APP_API_URL='/api/'
  process.env.VUE_APP_STATIC_URL='/static/'
}else {
  process.env.VUE_APP_API_URL='http://localhost:8000/api/'
  process.env.VUE_APP_STATIC_URL='http://localhost:8000/static/'
}

module.exports = {
  publicPath: process.env.NODE_ENV === 'production'
    ? '/static/'
    : '/'
}
