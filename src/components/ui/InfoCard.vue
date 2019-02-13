<template>
	<v-card class="panel-card">
		<v-card-title class="white--text primary-bg">
      <v-flex>
				<slot name="title"></slot>
      </v-flex>
		</v-card-title>
    <div class="panel-content secondary-bg d-flex">
			<slot name="content"></slot>
    </div>
	</v-card>
</template>

<script>
</script>

<style scoped>
.panel-card {
	/* height: 100%; */
	display: flex;
	flex-flow: column;
}

.panel-content {
	min-height: 50vh;
	height: 100%;
}
</style>
