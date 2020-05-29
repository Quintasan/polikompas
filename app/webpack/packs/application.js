/* eslint no-console:0 */
import Rails from '@rails/ujs'
import "controllers"
require("alpinejs")

// https://rossta.net/blog/importing-images-with-webpacker.html
require.context('../images', true)

document.addEventListener("DOMContentLoaded", function(event) {
  Rails.start();
});
