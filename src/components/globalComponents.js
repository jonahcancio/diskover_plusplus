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

//search Components
import ResultCard from "@/components/search/ResultCard"
import CategoryChip from "@/components/search/CategoryChip"
import SortSelect from "@/components/search/SortSelect"
import SearchBar from "@/components/search/SearchBar"
import CategorySelect from "@/components/search/CategorySelect"
import ResultPaginator from "@/components/search/ResultPaginator"

Vue.component("ResultCard", ResultCard)
Vue.component("CategoryChip", CategoryChip)
Vue.component("SortSelect", SortSelect)
Vue.component("SearchBar", SearchBar)
Vue.component("CategorySelect", CategorySelect)
Vue.component("ResultPaginator", ResultPaginator)

//MapView Components
import FormMapView from "@/components/map/FormMapView"
import BigMapView from "@/components/map/BigMapView"
Vue.component("FormMapView", FormMapView)
Vue.component("BigMapView", BigMapView)

//Details Components
import DirectionsTabItem from "@/components/details/DirectionsTabItem"
import DescriptionTabItem from "@/components/details/DescriptionTabItem"
import ImagesTabItem from "@/components/details/ImagesTabItem"
Vue.component("DirectionsTabItem", DirectionsTabItem)
Vue.component("ImagesTabItem", ImagesTabItem)
Vue.component("DescriptionTabItem", DescriptionTabItem)