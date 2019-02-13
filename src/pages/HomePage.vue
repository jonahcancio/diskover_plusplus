<template>
    <v-container>
        <h1 class="my-3 text-xs-center">
            Where to?
        </h1>
        <hr class="red-bar">
        <v-layout>
            <SearchBar/>
        </v-layout>
    </v-container>
</template>

<style scoped>
.red-bar {
    border: 1px solid #800000;
    width: 90%;
    margin: 3em auto;
}

#my-map {
    height: 480px;
}
</style>
