<template>
    <aside>
        <img src="/logo.png" alt="Dockified logo" class="logo"/>
        <ul class="doc-list">
            <li v-for="doc in documents" :key="doc.id" class="doc" 
                :class="isDocumentSelected(doc.id) ? 'is-selected' : ''">
                <a :href="`/documents/${doc.id}`" class="link">
                    {{doc.title}}
                </a>
            </li>
            <li class="doc">
                <a href="/documents/new" class="button is-primary is-outlined">Create New Document</a>
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
        isDocumentSelected(id) {
            const currentUrl = window.location.href
            return currentUrl.endsWith(`/documents/${id}`)
        },
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

.doc .link {
    padding: 1rem;
    display: block;
}

.is-selected {
    background: hsl(0, 0%, 93%);
}
</style>