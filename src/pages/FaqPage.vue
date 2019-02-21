<template>
    <v-container grid-list-lg class="grey lighten-4">
        <v-layout column id="faq">
            <h1 class="my-3 text-xs-center">
                Help Page
            </h1>
            <v-card color="primary">
                <v-card-title>
                    <h2 class="white--text">
                        Frequently Asked Questions
                    </h2>
                </v-card-title>
            </v-card>
            <v-expansion-panel>
                <v-expansion-panel-content>
                    <div slot="header" class="primary-bg">How do I search for a specific location?</div>
                    <v-icon slot="actions" color="white">$vuetify.icons.expand</v-icon>
                    <v-card color = "accent">
                        <v-card-text>
                            <ol>
                                <li>Use the search bar in the home page</li>
                                <li>Type in the location you wish to find</li>
                                <li>Select a location from the search results</li>
                            </ol>
                        </v-card-text>
                    </v-card>
                </v-expansion-panel-content>
            </v-expansion-panel>
            <v-expansion-panel>
                <v-expansion-panel-content>
                    <div slot="header">How do I search for a location by category?</div>
                    <v-icon slot="actions" color="white">$vuetify.icons.expand</v-icon>
                    <v-card color = "accent">
                        <v-card-text>
                            <ol>
                                <li>Click on the top left logo to go back to the home page.</li>
                                <li>Click on a category panel you wish to search for.</li>
                                <li>Choose a location from the list that will appear on the left of the next page.</li>
                            </ol>
                        </v-card-text>
                    </v-card>
                </v-expansion-panel-content>
            </v-expansion-panel>
            <v-expansion-panel>
                <v-expansion-panel-content>
                    <div slot="header">How do I get driving directions from the map?</div>
                    <v-icon slot="actions" color="white">$vuetify.icons.expand</v-icon>
                    <v-card color = "accent">
                        <v-card-text>
                            <ol>
                                <li>Click on the 'Map' button ont he upper right side of the homepage</li>
                                <li>If you are within UP Diliman, you can use your GPS to automatically track your location. Diskover++ will then generate a driving route to your destination.</li>
                                <li>If you are not within UP Diliman, a blue pin should show up at the Quezon Hall/Oblation Statue location. This blue pin acts as your origin point and you can drag this blue pin to any location. Diskover++ will then automatically generate driving directions for you.</li>
                            </ol>
                        </v-card-text>
                    </v-card>
                </v-expansion-panel-content>
            </v-expansion-panel>
        </v-layout>
    </v-container>

</template>

<script>
export default{

}
</script>

<style>

#faq .v-expansion-panel__header {
    background-color: var(--v-primary-base) !important;
    color: white;
}
</style>
