import Vue from 'vue'
import VueRouter from 'vue-router'

// import pages
import HomePage from "@/pages/HomePage"
// import FormPage from "@/pages/FormPage"
import AdminPage from "@/pages/AdminPage"
import MapPage from "@/pages/MapPage"
import ResultSide from "@/pages/MapPage/ResultSide"
import DetailSide from "@/pages/MapPage/DetailSide"
import FaqPage from "@/pages/FaqPage"
import Error404Page from "@/pages/Error404Page"

// use vue router
Vue.use(VueRouter)

// configure vue router
const router = new VueRouter({
  // history mode removes hashtag "#" in url
  mode: "history",
  // define routes
  routes: [
    // home page
		{
      path: "/",
      name: "home",
      component: HomePage
    },
    // map page with search and details page as subpages inside the side drawer
    {
      path: "/map",
      component: MapPage,
      name: "map",
      children: [
        {path: "search", name: "search", component: ResultSide},
        {path: "details/:locationId?", name: "details", component: DetailSide},
      ]
    },
    // form page for admin
    // {
    //   path: "/form/:mode/:id?",
    //   name: "form",
    //   component: FormPage
    // },
    //test route for form page
    {
      path: "/admin",
      component: AdminPage,
      name: "admin",
    },
    // faq page
    {
      path:"/faq",
      name: "faq",
      component: FaqPage,
    },
    // Error 404 page catches all pages that don't match above routes
    {
      path:"*",
      name: "404",
      component: Error404Page
    }
	]
})

export default router;
