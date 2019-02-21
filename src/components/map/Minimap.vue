<template>
    <div id="map" :style="{height: height}"></div>
</template>

<script>
import MapMixin from "@/mixins/MapMixin"
export default{
     mixins: [MapMixin],
}
</script>
