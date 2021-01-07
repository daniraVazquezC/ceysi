class Product < ApplicationRecord
  # Comentario: Si el campo de minimum_stock va con un valor nulo (nil) se le asigna el valor de 0 por defecto
  before_save :set_minimum_stock

  # Comentario: Este es el método que se llama en el before_save(antes de guardar)
  def set_minimum_stock
    self.minimum_stock = 0 if self.minimum_stock.nil?
  end
  
end
