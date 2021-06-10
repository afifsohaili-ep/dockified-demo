<template>
    <section class="doc">
        <h1 class="title">{{document.title}}</h1>
        <p v-html="document.body"></p>
    </section>
</template>

<script>
import { EventBus } from '../event-bus'
export default {
    props: {
        selectedDocument: Object
    },
    data() {
        let document = {}
        if (this.selectedDocument?.id) {
            document = {...this.selectedDocument}
        }
        return {document}
    },
    methods: {
        selectDocument(document) {
            this.document = document
        }
    },
    mounted() {
        EventBus.$on('document.selected', this.selectDocument)
    },
    destroyed() {
        EventBus.$off('document.selected', this.selectDocument)
    }
}
</script>

<style scoped>
.doc {
    padding: 2rem;
    border-left: 1px solid hsl(0, 0%, 86%);
    min-height: 100vh;
}
</style>