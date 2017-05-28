// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  $(".dropdown-toggle").on("click", function(e) {
    e.preventDefault();
    $(".dropdown").toggleClass("show");
  });
  $("[data-behavior~=close_alert]").on("click", function(e) {
    e.preventDefault();
    close(e);
  });
  $(".check_done").on("click", function(e) {
    $(this).parent().submit();
  })
});

function close(event) {
  var target = $(event.target).parent()
  target.fadeOut(600, function(e) {
      $(this).remove()
  })
}
