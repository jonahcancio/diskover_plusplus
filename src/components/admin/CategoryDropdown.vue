<template>
    <v-expansion-panel id="admindropdown">
        <v-expansion-panel-content>
            <div slot="header" class="primary-bg">{{category}}</div>
            <v-icon slot="actions" color="white">$vuetify.icons.expand</v-icon>
            <v-card color = "accent">
                <div >
                    <CategoryTable :locations="locations"/>
                </div>
            </v-card>
        </v-expansion-panel-content>
    </v-expansion-panel>
</template>

<script>
export default {
    data(){
        return{
            locations: ""
        };
    },
    props:['category'],
    mounted(){
        this.categoryLocations()
    },
    computed:{
        // reference Vuex Store results from the search module
        results() {
            return this.$store.state.search.results;
        },
        apiQuery() {
            return this.$store.getters["search/apiQuery"];
        }
    },
    methods:{
        categoryLocations(){
            this.$http
            .get(`${this.$backendApiPath}location`, {
                params: {
                    category: [this.category]
                },
                paramsSerializer: params => {
                    return this.$qs.stringify(params, { indices: false });
                }
            })
            // save results to Vuex Store search module if GET was successful
            .then(response => {
                this.locations = response.data.results
                console.log(this.locations)
            })
            // alert an error if unsuccessful GET
            .catch(error => {
                alert("error receiving queried results from API: ");
                console.log(error)
            });
        }
    }
}
</script>

<style>

#admindropdown .v-expansion-panel__header {
    background-color: var(--v-primary-base) !important;
    color: white;
}
</style>