# frozen_string_literal: true
# Comentario: configuración de la paginación, para cambiar el numero de registros por pagina, unicamente debe cambiarse 
# el valor de config.default_per_page = 15
Kaminari.configure do |config|
 config.default_per_page = 2
  # config.max_per_page = nil
  config.window = 2
  # config.outer_window = 0
  # config.left = 0
  # config.right = 0
  config.page_method_name = :page
  config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
