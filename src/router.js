import Vue from 'vue'
import VueRouter from 'vue-router'

import HomePage from "@/pages/HomePage"
import FormPage from "@/pages/FormPage"
import MapPage from "@/pages/MapPage"
import ResultSide from "@/pages/MapPage/ResultSide"
import DetailSide from "@/pages/MapPage/DetailSide"
import FaqPage from "@/pages/FaqPage"

Vue.use(VueRouter)

const router = new VueRouter({
  // mode: "history",
  routes: [
		{
      path: "/",
      name: "home",
      component: HomePage
    },
    {
      path: "/map",
      component: MapPage,
      name: "map",
      children: [
        {path: "search", name: "search", component: ResultSide},
        {path: "details/:locationId?", name: "details", component: DetailSide},
      ]
    },
    {
      path: "/form/:mode/:id?",
      name: "form",
      component: FormPage
    },
    {
      path:"/faq",
      name: "faq",
      component: FaqPage,
    }
	]
})

export default router;
