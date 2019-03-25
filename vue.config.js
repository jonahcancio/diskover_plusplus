// production mode means running from Django using built index.html file
// api and static urls will access the root folder directly
if(process.env.NODE_ENV === 'production') {
  process.env.VUE_APP_API_URL='/api/'
  process.env.VUE_APP_STATIC_URL='/static/'
}
// development mode means running 'npm run serve' to test on hot-reload dev server
// api and static urls will access localhost port where Django api is running
else {
  process.env.VUE_APP_API_URL='http://localhost:8000/api/'
  process.env.VUE_APP_STATIC_URL='http://localhost:8000/static/'
}

// the publicPath is where static css and js files are stored after building
// set to the Django static folder if built, else set to current directory
module.exports = {
  publicPath: process.env.NODE_ENV === 'production'
    ? '/static/'
    : '/'
}
