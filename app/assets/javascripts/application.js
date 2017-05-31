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
//= require masonry.pkgd.min

document.addEventListener("turbolinks:load", function() {

  // Dropdown For Mobile
  $(".dropdown-toggle").on("click", function(e) {
    e.preventDefault();
    $(this).siblings(".dropdown").toggleClass("show");
  });

  // Close Alert Box
  $("[data-behavior~=close_alert]").on("click", function(e) {
    e.preventDefault();
    close(e);
  });

  // Mark Task Done
  $(".check_done").on("click", function(e) {
    $(this).parent().submit();
  });

  // Toggle Settings
  $("[data-behavior~=toggle_settings]").on("click", function(e) {
    e.preventDefault();
    var $target_dropdown_menu =  $(this).siblings(".dropdown-menu");

    $(".dropdown-menu").each(function() {
      var $this = $(this);
      if ((!$this.is($target_dropdown_menu))) {
        $this.removeClass("show");
      }
    })

    $target_dropdown_menu.toggleClass("show");    
    e.stopPropagation();
  })
  $(window).on("click", function(e) {
    $(".dropdown-menu").removeClass("show");
  })

  // Dynamically Add Field
  $('form').on("click", ".add_fields", function(e) {
    $(this).before($(this).data('field'));  
    e.preventDefault();
  })

  // Grid Layout
  var $grid = $('.grid').masonry({
    // set itemSelector so .grid-sizer is not used in layout
    itemSelector: '.grid-item',
    percentPosition: true
  })
});

function close(event) {
  var target = $(event.target).parent()
  target.fadeOut(600, function(e) {
      $(this).remove()
  })
}
