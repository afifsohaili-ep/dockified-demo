<template>
    <section>
        <h1 class="title">{{document.title}}</h1>

        <p>
            {{document.body}}
        </p>
    </section>
</template>

<script>
import { EventBus } from '../event-bus'
export default {
    data() {
        const document = {}
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
section {
    padding: 1rem 0;
}
</style>