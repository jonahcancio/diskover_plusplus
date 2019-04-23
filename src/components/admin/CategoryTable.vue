<template>
    <v-data-table
        v-if="categories instanceof Array"
        :headers="headers"
        :items="categories"
        class="elevation-1"
    >
        <template v-slot:items="category">
            <td>{{category.item.name}}</td>
            <td>{{category.item.url}}</td>
            <td>
                <v-icon :color="category.item.routeColor">navigation</v-icon>
            </td>
            <td class="justify-center">
                <v-icon small class="mr-2" @click="$emit('edit-item',category.item.id)">edit</v-icon>
                <v-icon small class="mr-2" @click="$emit('delete-item',category.item.id)">delete</v-icon>
            </td>
        </template>
    </v-data-table>
</template>

<script>
export default {
    mounted() {
        console.log("WHERE AM I",this.locations);
    },
    props:{
        categories: {
            type: [Array],
            default: []
        }
    },
    data(){
        return{
            headers:[
                {text: 'Name', value: 'name'},
                {text: 'URL', value: 'url'},
                {text: 'Route Color', value: 'routeColor'},
                {text: 'Actions', value: ''}
            ],
        }
    },
}
</script>
