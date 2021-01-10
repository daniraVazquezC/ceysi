// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Comentario: Esto se agrega para que el sistema pueda utilizar bootstrap
require("bootstrap")
// Comentario: Esto se agrega para que los formularios anidados(nested_form) funcionen
require("jquery")
require("@nathanvda/cocoon")

// Comentario: Esto permite utilizar los iconos instalados con 'yarn add @fortawesome/fontawesome-free' en la consola
import "@fortawesome/fontawesome-free/css/all"

// Esto agrega las funciones creadas para que el sidebar funcione 
require("./custom/sidebar")
require("./custom/general_script")


import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})