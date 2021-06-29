<template>
	<h1 class="title" v-if="user">Welcome, {{user.email}}</h1>
	<inertia-link :href="documentsPath">Documents</inertia-link>
</template>

<script>
export default {
	props: {
		user: {
			type: Object,
			defaultValue() {
				return {}
			}
		}
	},
	setup() {
		return {
			documentsPath: window.Routes.documents_path()
		}
	},
}
</script>