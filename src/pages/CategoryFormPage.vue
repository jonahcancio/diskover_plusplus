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
                <div>Pick a color:<input type="color" @change="onColorSelected"></div>
            </v-flex>
            <v-flex xs12>
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
            </v-flex>
        </v-layout>
        <v-card-actions>
            <v-btn class="primary white--text">Submit</v-btn>
        </v-card-actions>
        </v-container>
    </v-card>
  </v-container>
</template>

<script>
export default{
    data(){
        return{
            imageFile: null,
            color: null
        }
    },
    methods:{
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
