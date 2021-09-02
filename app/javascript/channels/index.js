// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

import { initMapbox } from '../plugins/init_mapbox';

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const successCallBack = (position) => {
  console.log(postition);
};

const errorCallback = (error) => {
  console.log(error);
};

// navigator.geolocation.getCurrentposition(successCallBack, errorCallback);

document.addEventListener('turbolinks:load', () => {
  initMapbox();
})
