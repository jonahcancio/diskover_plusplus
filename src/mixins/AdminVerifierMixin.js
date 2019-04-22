const console = window.console

export default {
  created() {
    this.$store.commit("auth/initAuthHeader")
    this.$store.dispatch('auth/verifyToken')
      .then(() => {
        console.log("YOU HAVE PROVEN YOURSELF ADMIN. WELL DONE!!")
      })
      .catch(() => {
        console.log("YOU ARE NO ADMIN IN MY BOOKS!")
        this.$router.replace({name: "unauthenticated"})
      })    
  }
}