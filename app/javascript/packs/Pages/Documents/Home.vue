<template>
    <main>
        <documents-sidebar :documents="documents" class="sidebar"/>
        <document-viewer :selected-document="selectedDocument" class="viewer" :current-user-id="currentUserId"/>
    </main>
</template>

<script>
import DocumentsSidebar from './sidebar.vue'
import DocumentViewer from './viewer.vue'

export default {
    name: 'DocumentsHome',
    props: {
        documents: Array,
        selectedDocument: Object,
        currentUserId: Number
    },
    mounted() {
        console.log('this.currentUserId', this.currentUserId);
    },
    components: {DocumentsSidebar, DocumentViewer}
}
</script>

<style scoped>
main {
    display: flex;
    align-items: flex-start;
}

.sidebar {
    width: 33vw;
}

.viewer {
    width: 66vw;
}
</style>