<template>
    <v-data-table
        v-if="locations instanceof Array"
        :headers="headers"
        :items="locations"
        class="elevation-1"
    >
        <template v-slot:items="meow">
            <td>{{meow.item.name}}</td>
            <td>{{meow.item.description}}</td>
        </template>
    </v-data-table>
    <!-- <div>
        Hi there!
    </div> -->
</template>

<script>
export default {
    mounted() {
        console.log("WHERE AM I",this.locations);
    },
    props:{
        locations: {
            type: [String, Array],
            default: []
        }
    },
    data(){
        return{
            headers:[
                {text: 'Name', value: 'name'},
                {text: 'Description', value: 'description'}
            ],
        }
    },
}
</script>
