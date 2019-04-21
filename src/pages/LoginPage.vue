<template>
  <!-- Used to handle Web page requests that do not exist -->
  <v-container>
    <v-layout v-if="!isLoggedIn" class="display-1 pa-5 white-bg" column @keyup.enter="attemptLogIn">
      <div>Log in to your superuser account</div>
      <v-text-field
        v-model="username"
        label="Username"
        :error-messages="invalidLogInAttempt? 'username does not match with password' : null"
      />
      <v-text-field
        v-model="password"
        type="password"
        label="Password"
        :error-messages="invalidLogInAttempt? 'password does not match with username' : null"
      />
      <v-btn color="primary" @click="attemptLogIn">Log In</v-btn>
    </v-layout>
    <v-layout v-else class="display-1 pa-5 white-bg" column>
      <div>Currently logged in as 
        <span class="primary--text font-weight-bold">{{ loggedInUser }}</span>
      </div>
      <div>Logout?</div>
      <v-layout>
        <v-btn color="blue" @click="logOut">Yes</v-btn>
        <v-btn color="red" @click="backPage">No</v-btn>
      </v-layout>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    attemptLogIn() {
      this.$store.dispatch("auth/logIn", {
        username: this.username,
        password: this.password
      });
    },
    logOut() {
      this.$store.dispatch("auth/logOut");
    },
    backPage() {
      this.$router.go(-1);
    }
  },
  computed: {
    isLoggedIn() {
      return this.$store.getters["auth/isLoggedIn"];
    },
    invalidLogInAttempt() {
      return this.$store.state.auth.invalidLogInAttempt;
    },
    loggedInUser() {
      return this.$store.state.auth.user;
    }
  },
  destroyed() {
    this.$store.commit("auth/setInvalidLogInAttempt", false);
  }
};
</script>


<style>
.white-bg {
  background-color: white;
}
</style>
