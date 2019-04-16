<template>
    <v-data-table
        v-if="tags instanceof Array"
        :headers="headers"
        :items="tags"
        class="elevation-1"
    >
        <template v-slot:items="tag">
            <td>{{tag.item.name}}</td>
            <td class="justify-center">
                <v-icon small class="mr-2" @click="$emit('edit-item',tag.item.id)">edit</v-icon>
                <v-icon small class="mr-2" @click="$emit('delete-item', tag.item.id)">delete</v-icon>
            </td>
        </template>
    </v-data-table>
</template>

<script>
export default {
    mounted() {
        console.log("WHERE AM I",this.tags);
    },
    props:{
        tags: {
            type: [Array],
            default: []
        }
    },
    data(){
        return{
            headers:[
                {text: 'Name', value: 'name'},
                {text: 'Actions'}
            ],
        }
    },
}
</script>
