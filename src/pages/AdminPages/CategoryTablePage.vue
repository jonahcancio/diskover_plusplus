<template>
    <v-container>
        <v-btn class="primary white--text" @click="onClickNewCategory">
            ADD NEW CATEGORY
        </v-btn>
        <v-card>
            <v-card-title class="primary white--text">
                <h1>Categories</h1>
            </v-card-title>
            <v-layout>
                <v-flex>
                    <CategoryTable v-on:edit-item="onEditItem" v-on:delete-item="onDeleteItem" :categories="this.categories"/>
                </v-flex>
            </v-layout>
        </v-card>
    </v-container>
</template>

<script>
import AdminVerifierMixin from "@/mixins/AdminVerifierMixin"

export default{
    mixins: [AdminVerifierMixin],
    data(){
        return{
            categories: null
        }
    },
    mounted(){
        this.getCategories();
    },
    computed:{
        // reference the category names from the Vuex store
        // categories() {
        //     return this.$store.state.categories;
        // },
    },
    methods:{
        getCategories() {
            this.$http.get('/categorys/')
            .then(response =>{
                this.categories = response.data
                console.log("Categories successfully retreived")
            })
            .else(error =>{
                console.log("Failed to GET categories")
                console.log(error)
            })
        },
        onClickNewCategory(){
            this.$router.push(`/categoryform/create`)
        },
        onEditItem(id){
            this.$router.push(`/categoryform/update/${id}`)
        },
        onDeleteItem(id){
            this.$http.delete(`categorys/${id}`)
            .then(response =>{
                console.log("Successfully deleted item", response)
                this.getCategories()
            })
            .else(error =>{
                console.log("Failed to delete item", error)
            })
        }
    }
}
</script>