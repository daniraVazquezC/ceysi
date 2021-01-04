import $ from 'jquery';

$(document).ready(function () {

  $('#sidebarCollapse').on('click', function () {
    // muestra u oculta el sidebar
    $('#sidebar').toggleClass('active');
    $('#content').toggleClass('sidebar-active');
    // desplaza el contenido hacia la izquierda o hacia la derecha
    $('#content').toggleClass('toward-the-right');
  });

});
