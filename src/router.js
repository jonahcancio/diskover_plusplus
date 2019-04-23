import Vue from 'vue'
import VueRouter from 'vue-router'

// import pages
import HomePage from "@/pages/HomePage"


import CategoryTablePage from "@/pages/AdminPages/CategoryTablePage"
import TagTablePage from "@/pages/AdminPages/TagTablePage"

import CategoryFormPage from "@/pages/CategoryFormPage"
import TagFormPage from "@/pages/TagFormPage"

import MapPage from "@/pages/MapPage"
import ResultSide from "@/pages/MapPage/ResultSide"
import DetailSide from "@/pages/MapPage/DetailSide"
import FaqPage from "@/pages/FaqPage"
import Error404Page from "@/pages/Error404Page"

import LoginPage from "@/pages/LoginPage"
import DummyPage from "@/pages/DummyPage"

import AdminPages from "@/pages/AdminPages"
import LocationImagesFormPage from "@/pages/AdminPages/LocationImagesFormPage"
import DeleteImagesFormPage from "@/pages/AdminPages/DeleteImagesFormPage"
import LocationCRUDFormPage from "@/pages/AdminPages/LocationCRUDFormPage"
import UploadImagesFormPage from "@/pages/AdminPages/UploadImagesFormPage"
import UnauthenticatedPage from "@/pages/AdminPages/UnauthenticatedPage"

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
        { path: "search", name: "search", component: ResultSide },
        { path: "details/:id?", name: "details", component: DetailSide },
      ]
    },
    // form page for admin
    {
      path: "/admin",
      name: "admin_blank",
      component: AdminPages,
      children: [
        {
          path: "location/form/:mode/:id?",
          name: "location_crud_form",
          component: LocationCRUDFormPage
        },
        {
          path: "location/images/form/:id",
          name: "location_images_form",
          component: LocationImagesFormPage
        },
        {
          path: "images/form/delete",
          name: "delete_images_form",
          component: DeleteImagesFormPage
        },
        {
          path: "images/form/upload",
          name: "upload_images_form",
          component: UploadImagesFormPage
        },
        {
          path: "browse/categories",
          component: CategoryTablePage,
          name: "categorytable"
        },
        {
          path: "browse/tags",
          component: TagTablePage,
          name: "tagtable"
        },
        {
          path: "unauthenticated",
          name: "unauthenticated",
          component: UnauthenticatedPage
        },
        {
          path: "*",
          component: Error404Page
        }
      ]
    },    
    // faq page
    {
      path: "/faq",
      name: "faq",
      component: FaqPage,
    },
    {
      path: "/login",
      name: "login",
      component: LoginPage,
    },
    {
      path: "/dummy",
      name: "dummy",
      component: DummyPage
    },
    //category form page
    {
      path: "/categoryform/:mode/:id?",
      name: "categoryform",
      component: CategoryFormPage,
    },
    {
      path: "/tagform/:mode/:id?",
      name: "tagform",
      component: TagFormPage,
    },
    // Error 404 page catches all pages that don't match above routes
    {
      path: "*",
      name: "404",
      component: Error404Page
    },

  ]
})

export default router;
