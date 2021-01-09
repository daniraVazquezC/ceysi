import $ from 'jquery';
import 'select2'
import 'select2/dist/css/select2.css'

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

  $('#new_outbound_order').on('cocoon:after-insert', function() {
    $('.select-product').select2()
  });

});
