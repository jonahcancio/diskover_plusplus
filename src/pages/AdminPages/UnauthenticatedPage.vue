<template>
  <v-container>
    <v-layout class="display-1 pt-4" column>
      <v-flex>Sorry, the page you are trying to access is for admin users only.</v-flex>
      <v-flex>
        <div class="my-5">
          Log in as an admin to be granted access to this page
          <v-btn color="primary" to="/login">Login Page</v-btn>
        </div>
        <div>
          Or just go back to our home page
          <v-btn color="primary" to="/">Home Page</v-btn>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>
