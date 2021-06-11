<template>
    <section class="doc">
        <div class="actions" v-if="document && document.id">
            <a :href="`/documents/${document.id}/edit`" class="button is-small is-outlined">
                Edit
            </a>
            <form action="/watches" accept-charset="UTF-8" method="post">
                <input type="hidden" name="authenticity_token" :value="authenticityToken">
                <input type="hidden" name="watch[user_id]" id="watch_user_id" :value="currentUserId">
                <input type="hidden" name="watch[document_id]" id="watch_document_id" :value="document.id">
                <input type="submit" name="commit" value="Watch" class="button is-small is-primary">
            </form>
        </div>
        <h1 class="title">{{document.title}}</h1>
        <p v-html="document.body"></p>
    </section>
</template>

<script>
import { EventBus } from '../event-bus'
export default {
    props: {
        selectedDocument: Object,
        currentUserId: Number
    },
    data() {
        const authenticityToken = window.document.querySelector('meta[name=csrf-token]')?.getAttribute?.('content')
        let document = {}
        if (this.selectedDocument?.id) {
            document = {...this.selectedDocument}
        }
        return {
            document, 
            authenticityToken
        }
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

.actions {
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.actions > * {
    margin-left: 0.5rem;
}
</style>