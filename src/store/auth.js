import axios from "axios"
const console = window.console

// Vuex Store module to be used by the authentication components
export default {
    namespaced: true,
    state: {
        // stores the jwt token used for authentication
        jwt: localStorage.getItem('jwt'),
        // stores currently authenticated username
        user: localStorage.getItem('user'),
        // is true if someone attempted to log in with invalid username/password; false otherwise
        invalidLogInAttempt: false
    },
    mutations: {
        // set the jwt token, store in local storage and configure axios headers
        setToken(state, newToken) {
            localStorage.setItem('jwt', newToken);
            state.jwt = newToken;
            axios.defaults.headers.common['Authorization'] = `JWT ${newToken}`;
        },
        // clear jwt token from state, local storage and axios headers
        deleteToken(state) {
            localStorage.removeItem('jwt');
            state.jwt = null;
            axios.defaults.headers.common['Authorization'] = null;
        },
        // set user in store and local storage
        setUser(state, newUser) {
            localStorage.setItem('user', newUser);
            state.user = newUser;
        },
        // clear user from store and local storage
        deleteUser(state) {
            localStorage.removeItem('user');
            state.user = null;
        },
        // set invalid login attempt bool
        setInvalidLogInAttempt(state, newInvalid) {
            state.invalidLogInAttempt = newInvalid;
        },
        // set api authentication header
        initAuthHeader(state) {
            axios.defaults.headers.common['Authorization'] = `JWT ${state.jwt}`;
        },
        // reset api authentication header
        resetAuthHeader() {
            axios.defaults.headers.common['Authorization'] = null
        }
    },
    getters: {
        // returns true if has been logged in
        isLoggedIn(state) {
            return state.user != null && state.jwt != null
        }
    },
    actions: {
        // verifies if token is valid and has not expired yet
        // logs user out if invalid or has expired
        verifyToken({ state, dispatch, commit }) {
            commit('initAuthHeader')
            return new Promise((resolve, reject) => {
                axios.post('/api-token-verify/', {
                    'token': state.jwt
                }).then((response) => {
                    console.log("Successfully verified token!\n", response)                    
                    resolve()
                }).catch((error) => {
                    console.log("Invalid token cannot be verified :(\n", error)
                    dispatch('logOut')
                    reject()
                })
            })
        },
        // attempts a login using the username and password supplied in its payload
        logIn({ commit }, { username, password }) {
            axios.post(`/api-token-auth/`, {
                username: username,
                password: password
            }).then(response => {                
                commit("setToken", response.data.token)
                commit("setUser", username)
                commit("setInvalidLogInAttempt", false)
                console.log("Successfully authenticated token: You are now logged in\n", response)
            }).catch(error => {
                console.log(error)
                console.log("Invalid username and password for authentication, you remain logged out\n", error)
                commit("setInvalidLogInAttempt", true)
            });
        },
        // performs logout
        logOut({ commit }) {            
            commit("deleteToken");
            commit("deleteUser");
            console.log("Successfully deleted token: You are now logged out\n")
        },
    }
}
