<template>
    <aside>
        <img src="/logo.png" alt="Dockified logo" class="logo"/>
        <ul class="doc-list">
            <li v-for="doc in documents" :key="doc.id">
                <a :href="`documents/${doc.id}`" @click.prevent="chooseArticle(doc)">
                    {{doc.title}}
                </a>
            </li>
        </ul>
    </aside>
</template>

<script>
import {EventBus} from '../event-bus'

export default {
    props: {
        documents: Array
    },
    methods: {
        chooseArticle(document) {
            EventBus.$emit('document.selected', document)
        }
    }
}
</script>

<style scoped>
.logo {
    display: block;
    margin: 1rem auto;
    width: 6rem;
}

.doc-list {
    padding: 1rem;
}
</style>