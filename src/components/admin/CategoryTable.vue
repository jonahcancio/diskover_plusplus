<template>
    <v-data-table
        :headers="headers"
        :items="locations"
        class="elevation-1"
    >
        <template v-slot:items="props">
            <td>{{props.item.name}}</td>
            <td>{{props.item.description}}</td>
        </template>
    </v-data-table>
    <!-- <div>
        Hi there!
    </div> -->
</template>

<script>
export default {
    props:{
        locations: Array
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
