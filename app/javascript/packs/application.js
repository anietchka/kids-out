// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';

// MapBox
import { initMapbox } from '../plugins/init_mapbox';
import { initCurrentPosition } from '../plugins/init_position';
import { initStarRating } from '../plugins/init_star_rating';



// Meetup
import { initMeetupCable } from '../channels/meetup_channel'

// Date picker
import { initFlatpickr } from "../plugins/init_flatpickr";


import { toggleTrashCard } from "../components/toggle_trash_card";

import { toggleFavoriteCard } from "../components/toggle_favorite_card";

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  // initCurrentPosition();
  initMeetupCable();
  initStarRating();
  initFlatpickr();
  toggleTrashCard();
  toggleFavoriteCard();

})

import "controllers"
