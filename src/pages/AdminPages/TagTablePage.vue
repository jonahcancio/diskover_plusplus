<template>
    <v-container>
        <v-btn class="primary white--text" @click="onClickNewTag">
            ADD NEW TAG
        </v-btn>
        <v-card>
            <v-card-title class="primary white--text">
                <h1>Tags</h1>
            </v-card-title>
            <v-layout>
                <v-flex>
                    <TagTable :tags="this.tags"/>
                </v-flex>
            </v-layout>
        </v-card>
    </v-container>
</template>

<script>
export default{
    data(){
        return{
            tags: null
        }
    },
    mounted(){
        this.getTags()
    },
    methods:{
        // reference the category names from the Vuex store
        getTags() {
            this.$http.get('/tags/')
            .then(response =>{
                this.tags = response.data
                console.log("Tags successfully retreived")
            })
            .else(error =>{
                console.log("Failed to GET tags")
                console.log(error)
            })
        },
        onClickNewTag(){
            this.$router.push(`/tagform/create`)
        }
    }
}
</script>