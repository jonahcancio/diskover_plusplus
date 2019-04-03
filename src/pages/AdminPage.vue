<template>
    <v-container grid-list-md>
        <v-layout column>
            <!-- <CategoryTable/> -->
            <v-flex>
                <router-link :to="{name: 'form'}">
                    <v-btn class="primary-bg white--text">
                        + Add new location
                    </v-btn>
                </router-link>
            </v-flex>
            
            <v-flex>
                <v-card>
                    <v-card-title class="primary-bg white--text">
                        Edit Location
                    </v-card-title>
                    <v-card-actions>
                        <SearchBar />
                    </v-card-actions>
                </v-card>
            </v-flex>
            <v-flex grid-list-lg>
                <v-card color="primary">
                    <v-card-title>
                        <h2 class="white--text">
                            Database
                        </h2>
                    </v-card-title>
                </v-card>
                <div v-for="(item, i) in categories" :key="i">
                    <CategoryDropdown :category = "item"/>
                </div>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
export default {
    computed: {
        // reference the category names from the Vuex store
        categories() {
            return this.$store.getters["categoryNames"];
        },
    },
};
</script>

<style>
</style>