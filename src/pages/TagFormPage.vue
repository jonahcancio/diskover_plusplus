<template>
  <v-container grid-list-lg class="grey lighten-4">
    <v-card>
        <v-card-title class="primary">
            <h1 v-if="mode == 'create'" class="white--text">Add Tag</h1>
            <h1 v-else class="white--text">Edit Tag</h1>
        </v-card-title>
        <v-container>
            <v-layout column>
            <v-flex xs12>
                <label>Name</label>
                <v-text-field
                placeholder="Name of the tag"
                color="black"
                v-model="name"
                :readonly="isReadOnly"
                :error="isReadOnly"
                />
            </v-flex>
        </v-layout>
        <v-card-actions>
            <v-btn class="primary white--text" v-on:click="onSubmitClick" :disabled="isSubmitting">Submit</v-btn>
            <v-btn v-if="mode != 'create'" class="primary white--text" v-on:click="onDeleteClick" :disabled="isSubmitting">Delete</v-btn>
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
            isSubmitting: false
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
        handleRouteChange() {
            if (this.mode == "update" || this.mode == "delete") {
                console.log("mode: ", this.mode);
                this.getUpdateData(this.id);
            }
        },
        getUpdateData(id){
            this.$http.get(`/tags/${id}`)
            .then(response => {
                let {name} = response.data;
                this.name = name;
            })
            .catch(error => {
                console.log(`Failed to get tag ${id}`);
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
            this.isSubmitting = true
            this.$http.delete(`/tags/${this.id}/`)
            .then(response => {
                console.log('Successfully deleted tag')
                console.log(response)
                this.name = null;
                this.$router.push(`/tagform/create/`);
            })
            .catch(error => {
                alert("Failed to delete tag")
                console.log(error)
            })
            .finally(() => {
                this.isSubmitting = false
            })
        },
        onCancelClick(){
            this.$router.push(`/admin/browse/tags`)
        },
        handlePush(){
            this.isSubmitting = true
            console.log(`You are editing tag ${this.id}`)
            this.$http.patch(`/tags/${this.id}/`,{
                name: this.name
            })
            .then(response => {
                console.log(response)
            })
            .catch(error => {
                console.log(error)
            })
            .finally(() => {
                this.isSubmitting = false
            })
        },
        handlePost(){
            this.isSubmitting = true
            this.$http.post('/tags/',{
                name: this.name
            })
            .then(response => {
                console.log(response);
                this.$router.push(`/admin/browse/tags`);
            })
            .catch(error => {
                alert(error)
            })
            .finally(() => {
                this.isSubmitting = false
            })
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
