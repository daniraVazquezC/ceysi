import $ from 'jquery';

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

  

});


