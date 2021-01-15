import $ from 'jquery';

// Comentario: Se agregan los estilos y el javascript del pugin bootstrap-select
import 'bootstrap-select';
import 'bootstrap-select/dist/css/bootstrap-select.css'


$(document).on('turbolinks:load', function () {

  /* Comentario: Esta funcion despliega el input para indicar la cantidad minima de stock si el producto tendra una cantidad minima,
  * funciona al cargar la pagina*/
    if( $('#product_with_minimum_stock').is(':checked') ) {
      $('#minimum_stock_quantity').show(1000);
    } else{
      $('#minimum_stock_quantity').hide();
    }  

  /* Comentario: Esta funcion despliega el input para indicar la cantidad minima de stock si el producto tendra una cantidad minima,
  * funciona al hacer un cambio en el checkbox*/
  $("#product_with_minimum_stock").on('change', function(){
    if( $('#product_with_minimum_stock').is(':checked') ) {
      $('#minimum_stock_quantity').show(1000);
    }
    else{
      $('#minimum_stock_quantity').hide(1000);
    }    
  });

  // Comentario: Esto es para indicar que en el formulario anidado se va a utilizar un selector especial para las busquedas (bootstrap-select)
  $('#new_outbound_order').on('cocoon:after-insert', function() {
    $('.select-product').selectpicker();
  });

  $('#new_inbound_order').on('cocoon:after-insert', function() {
    $('.select-product').selectpicker();
  });

  // Comentario: Esto es para desplegar el area de ajuste de cantidades
  $('.quantity-adjustment').on('click', function(){
    $('#quantity-adjustment').show();
  });



});
