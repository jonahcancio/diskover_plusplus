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
                <v-icon small class="mr-2" @click="onClickEdit(tag.item.id, $event)">edit</v-icon>
                <v-icon small class="mr-2" @click="onClickDelete(tag.item.id,$event)">delete</v-icon>
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
    methods:{
        onClickEdit(id){
            this.$router.push(`/tagform/update/${id}`)
        },
        onClickDelete(id){
            this.$http.delete(`tags/${id}`)
            .then(response =>{
                console.log("Successfully deleted item", response)
                this.$router.go()
            })
            .else(error =>{
                console.log("Failed to delete item", error)
            })
        }
    }
}
</script>
