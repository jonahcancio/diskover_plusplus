const console = window.console

export default {
  created() {
    this.$store.dispatch('auth/verifyToken', this.$http)
      .then(() => {
        console.log("YOU HAVE PROVEN YOURSELF ADMIN. WELL DONE!!")
      })
      .catch(() => {
        console.log("YOU ARE NO ADMIN IN MY BOOKS!")
        this.$router.replace({name: "unauthenticated"})
      })    
  }
}