// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { createApp, h } from 'vue'
import { InertiaProgress } from '@inertiajs/progress'
import * as Routes from 'routes';
import { createInertiaApp } from '@inertiajs/inertia-vue3'

Rails.start()
ActiveStorage.start()
InertiaProgress.init()

window.Routes = Routes;

createInertiaApp({
  resolve: name => require(`./Pages/${name}`),
  setup({ el, app, props, plugin }) {
    createApp({ render: () => h(app, props) })
      .use(plugin)
      .mount(el)
  },
})