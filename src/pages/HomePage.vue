<template>
    <v-container grid-list-md text-xs-center>
        <v-layout row wrap>
            <!-- <v-flex xs5>
                <v-card color="rgba(211,47,47,0.8)">
                    <v-container grid-list-md text-xs-left>
                        <v-layout column>
                            <v-flex>
                                <v-card color="accent">
                                    <v-card-title>
                                        <h1>Welcome to Diskover++</h1>
                                    </v-card-title>
                                    <v-card-text>
                                        Diskover++ is a project from students of the Department of Computer Science in UP Diliman. Please help us by reporting broken links or providing comments and suggestions through this form. We need your feedback to help us improve the site.
                                    </v-card-text>
                                </v-card>
                            </v-flex>

                            <v-flex>

                            </v-flex>

                        </v-layout column>
                    </v-container>
                </v-card>
            </v-flex> -->

            <v-flex>
                <v-card color="rgba(211,47,47,0.8)">
                    <v-container grid-list-md text-xs-left>
                        <v-layout column>
                            <v-flex>
                                <v-card color="accent">
                                    <v-card-title>
                                        <h1>Welcome to Diskover++</h1>
                                    </v-card-title>
                                    <v-card-text>
                                        Diskover++ is a project from students of the Department of Computer Science in UP Diliman. Please help us by reporting broken links or providing comments and suggestions through this form. We need your feedback to help us improve the site.
                                    </v-card-text>
                                </v-card>
                            </v-flex>

                            <v-flex>
                                <v-card color="accent">
                                    <v-card-title>
                                        <h1 >Where would you like to go?</h1>

                                        <v-container>
                                            <v-flex fillheight>
                                                <v-card color="secondary">
                                                    <v-card-action>
                                                        <v-container>
                                                            <div class="headline">Use our search bar</div>
                                                            <SearchBar />
                                                        </v-container>
                                                    </v-card-action>
                                                </v-card>
                                            </v-flex>

                                            <v-flex text-xs-center>
                                                <h1>OR</h1>
                                            </v-flex>

                                            <v-flex>
                                                <v-card to="/map" color="secondary">
                                                    <v-container>
                                                        <v-flex>
                                                            <div class="headline">Use our map</div>
                                                        </v-flex>
                                                        <v-flex>
                                                            <Minimap height="400px" />
                                                        </v-flex>
                                                    </v-container>
                                                </v-card>
                                            </v-flex>

                                            <v-flex text-xs-center>
                                                <h1>OR</h1>
                                            </v-flex>
                                            
                                            <v-flex>
                                                <v-card color="secondary">
                                                    <v-container>
                                                        <v-flex>
                                                            <div class="headline">Select from our categories</div>
                                                        </v-flex>
                                                        <v-flex>

                                                        </v-flex>
                                                    </v-container>
                                                </v-card>
                                            </v-flex>
                                        </v-container>
                                    </v-card-title>
                                </v-card>
                            </v-flex>
                        </v-layout column>
                    </v-container>
                </v-card>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
export default{

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
