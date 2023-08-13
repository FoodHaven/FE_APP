// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
//= require jquery3
//= require popper
//= require bootstrap
// application.js
$(document).ready(function() {
  $('#darkModeToggle').click(function() {
    $('body').toggleClass('dark-mode');
  });
});
