// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
