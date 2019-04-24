<template>
  <v-container grid-list-lg class="grey lighten-4">
    <v-card>
        <v-card-title class="primary">
            <h1 class="white--text">Edit Category</h1>
        </v-card-title>
        <v-container>
            <v-layout column>
            <v-flex xs12>
                <label>Name</label>
                <v-text-field
                placeholder="Name of the category"
                color="black"
                v-model="name"
                :readonly="isReadOnly"
                :error="isReadOnly"
                />
            </v-flex>
            <v-flex xs12>
                <label>URL</label>
                <v-text-field
                    v-model="url"
                    color="black"
                    auto-grow
                    placeholder="Url to be displayed for this category"
                    :readonly="isReadOnly"
                    :error="isReadOnly"
                />
            </v-flex>
            <v-flex xs12>
                <label>Route Color</label>
                <div>Pick a color:<input type="color" v-model="color" @change="onColorSelected"></div>
            </v-flex>
            <!-- <v-flex xs12>
                <label>Image</label>
                <div><input type="file" @change="onImageFileSelected"></div>
            </v-flex>
            <v-flex xs12>
                <label>Marker</label>
                <div><input type="file" @change="onImageFileSelected"></div>
            </v-flex>
            <v-flex xs12>
                <label>Route Marker</label>
                <div><input type="file" @change="onImageFileSelected"></div>
            </v-flex> -->
        </v-layout>
        <v-card-actions>
            <v-btn class="primary white--text" @click="onSubmitClick">Submit</v-btn>
            <v-btn v-if="mode != 'create'" class="primary white--text" v-on:click="onDeleteClick">Delete</v-btn>
            <v-btn class="green white--text" @click="onCancelClick">Cancel</v-btn>
        </v-card-actions>
        </v-container>
    </v-card>
  </v-container>
</template>

<script>
import AdminVerifierMixin from "@/mixins/AdminVerifierMixin"
export default{
    mixins: [AdminVerifierMixin],
    data(){
        return{
            name: null,
            url: null,
            color: null
        }
    },
    computed:{
        id() {
            return this.$route.params.id;
        },
        mode() {
            return this.$route.params.mode;
        }
    },
    mounted(){
        this.handleRouteChange()
    },
    methods:{
        handleRouteChange(){
            if (this.mode == "update" || this.mode == "delete") {
                console.log("mode: ", this.mode);
                console.log("color: ",this.color)
                this.getUpdateData(this.id);
            }
        },
        getUpdateData(id){
            this.$http.get(`/categorys/${id}`)
            .then(response => {
                let {name, url, routeColor} = response.data;
                this.name = name;
                this.url = url;
                this.color = routeColor;
                console.log(this.color)
            })
            .else(error => {
                console.log(`Failed to get category ${id}`);
                console.log(error);
            })
        },
        onSubmitClick(){
            if(this.mode == 'create'){
                this.handlePost()
            }else if(this.mode == "update"){
                this.handlePush()
            }
        },
        onDeleteClick(){
            this.$http.delete(`/categorys/${this.id}/`)
            .then(response => {
                console.log('Successfully deleted category')
                console.log(response)
                this.name = null;
                this.$router.push(`/categoryform/create/`);
            })
            .else(error => {
                console.log("Failed to delete category")
                console.log(error)
            })
        },
        onCancelClick(){
            this.$router.push(`/admin/browse/categories`)
        },
        handlePush(){
            console.log(`You are editing category ${this.id}`)
            this.$http.patch(`/categorys/${this.id}/`,{
                name: this.name,
                url: this.url,
                routeColor: this.color,
            })
            .then(response => {
                console.log(response)
                this.$router.push(`/admin/browse/categories`)
            })
            .else(error => {
                console.log(error)
            })
        },
        handlePost(){
            this.$http.post('/categorys/',{
                name: this.name,
                url: this.url,
                routeColor: this.color,
            })
            .then(response => {
                console.log(response)
                this.$router.push(`/admin/browse/categories`)
            })
            .else(error => {
                console.log(error)
            })
        },
        onImageFileSelected(event){
            this.imageFile = event.target.files[0]
        },
        onColorSelected(event){
            this.color = event.target.value
            console.log(this.color)
        }
    }
}
</script>

<style scoped>
    label {
    font-weight: bold !important;
    font-size: 16px !important;
    }
</style>
