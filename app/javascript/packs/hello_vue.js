import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import DocumentsHome from '../documents/home.vue'
import DocumentEditor from '../documents/editor.vue'
import VueWysiwyg from "vue-wysiwyg"
import 'buefy/dist/buefy.css'
import 'vue-wysiwyg/dist/vueWysiwyg.css'

Vue.use(TurbolinksAdapter)
Vue.use(VueWysiwyg, {})

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#hello',
    components: { DocumentsHome, DocumentEditor }
  })
  window.Vue = app
})