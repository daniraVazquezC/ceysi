import $ from 'jquery';

$(document).on('turbolinks:load', function () {

  // Comentario: logica que muestra u oculta el sidebar
  $("#close-sidebar").on('click',function() {
    $(".page-wrapper").removeClass("toggled");
  });
  $("#show-sidebar").on('click',function() {
    $(".page-wrapper").addClass("toggled");
  });
  
  
});
