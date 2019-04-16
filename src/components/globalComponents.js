//GLOBAL COMPONENTS
import Vue from "vue"

//UI Components
import InfoCard from "@/components/ui/InfoCard"
import NavBar from "@/components/ui/NavBar"
import Background from "@/components/ui/Background"
import SideDrawer from "@/components/ui/SideDrawer"
import FloatingButton from "@/components/ui/FloatingButton"
import BottomModal from "@/components/ui/BottomModal"
import CenterModal from "@/components/ui/CenterModal"
Vue.component("NavBar", NavBar)
Vue.component("Background", Background)
Vue.component("InfoCard", InfoCard)

Vue.component("SideDrawer", SideDrawer)
Vue.component("FloatingButton", FloatingButton)
Vue.component("BottomModal", BottomModal)
Vue.component("CenterModal", CenterModal)

//Home Components
import CategoryCard from "@/components/home/CategoryCard"
Vue.component("CategoryCard", CategoryCard)

//search Components
import ResultCard from "@/components/search/ResultCard"
import SortSelect from "@/components/search/SortSelect"
import SearchBar from "@/components/search/SearchBar"
import CategorySelect from "@/components/search/CategorySelect"
import ResultPaginator from "@/components/search/ResultPaginator"
import TagsSelect from "@/components/search/TagsSelect"

Vue.component("ResultCard", ResultCard)
Vue.component("SortSelect", SortSelect)
Vue.component("SearchBar", SearchBar)
Vue.component("CategorySelect", CategorySelect)
Vue.component("ResultPaginator", ResultPaginator)
Vue.component("TagsSelect", TagsSelect)

//Map Components
import FormMapView from "@/components/map/FormMapView"
import BigMapView from "@/components/map/BigMapView"
import GpsMapHidden from "@/components/map/GpsMapHidden"
import Minimap from "@/components/map/Minimap"
Vue.component("FormMapView", FormMapView)
Vue.component("BigMapView", BigMapView)
Vue.component("GpsMapHidden", GpsMapHidden)
Vue.component("Minimap", Minimap)

//Details Components
import DirectionsTabItem from "@/components/details/DirectionsTabItem"
import DescriptionTabItem from "@/components/details/DescriptionTabItem"
import ImagesTabItem from "@/components/details/ImagesTabItem"
import NearbyLocationsTabItem from "@/components/details/NearbyLocationsTabItem"
import SubareaTabItem from "@/components/details/SubareaTabItem"
import MainBuildingTabItem from "@/components/details/MainBuildingTabItem"

Vue.component("DirectionsTabItem", DirectionsTabItem)
Vue.component("ImagesTabItem", ImagesTabItem)
Vue.component("DescriptionTabItem", DescriptionTabItem)
Vue.component("NearbyLocationsTabItem", NearbyLocationsTabItem)
Vue.component("SubareaTabItem", SubareaTabItem)
Vue.component("MainBuildingTabItem", MainBuildingTabItem)

//Admin Page Components
import CategoryDropdown from "@/components/admin/CategoryDropdown"
import CategoryTable from "@/components/admin/CategoryTable"
Vue.component("CategoryDropdown", CategoryDropdown)
Vue.component("CategoryTable", CategoryTable)

import AdminResultCard from "@/components/admin/AdminResultCard"
import AdminSortSelect from "@/components/admin/AdminSortSelect"
import AdminSearchBar from "@/components/admin/AdminSearchBar"
import AdminCategorySelect from "@/components/admin/AdminCategorySelect"
import AdminTagsSelect from "@/components/admin/AdminTagsSelect"

Vue.component("AdminResultCard", AdminResultCard)
Vue.component("AdminSortSelect", AdminSortSelect)
Vue.component("AdminSearchBar", AdminSearchBar)
Vue.component("AdminCategorySelect", AdminCategorySelect)
Vue.component("AdminTagsSelect", AdminTagsSelect)
