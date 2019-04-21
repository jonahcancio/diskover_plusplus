<template>
    <v-container>
        <v-btn class="primary white--text">
            ADD NEW CATEGORY
        </v-btn>
        <v-card>
            <v-card-title class="primary white--text">
                <h1>Categories</h1>
            </v-card-title>
            <v-layout>
                <v-flex>
                    <CategoryTable :categories="this.categories"/>
                </v-flex>
            </v-layout>
        </v-card>
    </v-container>
</template>

<script>
import AdminVerifierMixin from "@/mixins/AdminVerifierMixin"

export default{
    mixins: [AdminVerifierMixin],
    computed:{
        // reference the category names from the Vuex store
        categories() {
            return this.$store.state.categories;
        },
    }
}
</script>