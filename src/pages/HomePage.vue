<template>
    <div>
        <v-card>
            <v-parallax :src="require('@/assets/backgrounds/bgimg.jpg')" height="350" dark>
                <!-- <v-card color="rgba(255,255,255,0.4)">
                <v-card-title>
                    <h1>Welcome to Diskover++</h1>
                </v-card-title>
                <v-card-text>
                    Diskover++ is a project from students of the Department of Computer Science in UP Diliman. Please help us by reporting broken links or providing comments and suggestions through this form. We need your feedback to help us improve the site.
                </v-card-text>
                </v-card> -->
                <v-layout align-center justify-center column>
                    <h1 class="display-3 font-weight-light mb-3">DISKOVER ++</h1>
                    <!-- <v-flex shrink class="subheader">
                        <h4>Diskover++ is a project from students of the Department of Computer Science in UP Diliman. Please help us by reporting broken links or providing comments and suggestions through this form. We need your feedback to help us improve the site.</h4>
                    </v-flex> -->
                </v-layout>
            </v-parallax>
        </v-card>

        <v-container grid-list-md text-xs-left fluid>
            <v-layout>
                <v-flex>
                    <v-card color="white">
                        <v-card-title>
                            <h1>Where would you like to go?</h1>

                            <v-container fluid>
                                <v-layout row fill-height>
                                <v-flex xs4>
                                    <v-card color="secondary">
                                        <v-card color="red" class="pa-3" height="60">
                                            <h2 class="white--text">Use our search bar</h2>
                                        </v-card>
                                        <v-container>
                                            <SearchBar />
                                        </v-container>
                                    </v-card>
                                </v-flex>

                                <v-flex xs4>
                                    <v-card to="/map" color="secondary">
                                        <v-card color="red" class="pa-3" height="60">
                                            <h2 class="white--text">Use our map</h2>
                                        </v-card>
                                        <v-container>
                                            <v-flex>
                                                <Minimap height="200px" />
                                            </v-flex>
                                        </v-container>
                                    </v-card>
                                </v-flex>

                                <v-flex xs4>
                                    <v-card color="secondary">
                                        <v-card color="red" class="pa-3" height="60">
                                            <h2 class="white--text">Select from our categories</h2>
                                        </v-card>
                                        <v-layout column text-xs-center pa-2>
                                            <v-flex v-for="item in categories">
                                                <v-card color="accent"
                                                :to="{
                                                    path:'/map/search',
                                                    query:{category:item}
                                                }"
                                                ><h3>{{item}}</h3></v-card>
                                            </v-flex>
                                        </v-layout>
                                    </v-card>
                                </v-flex>
                            </v-layout>
                            </v-container>
                        </v-card-title>
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
</div>
</template>

<script>
export default {
    computed: {
        categories(){
            return this.$store.getters["categoryNames"]
        }
    }
}
</script>

<style scoped>
.red-bar {
    border: 1px solid #800000;
    width: 90%;
    margin: 3em auto;
}

#my-map {
    height: 480px;
}
</style>
