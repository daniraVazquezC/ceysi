class Product < ApplicationRecord
  # Comentario: se indica que el producto tendra una imagen asociada
  has_one_attached :product_image

  # Comentario: Esto indica una relacion con los detalles de transacciones en donde un "product" tiene o puede tener 
  # muchos "transaction_detail"
  has_many :transaction_details

  # Comentario: Si el campo de minimum_stock va con un valor nulo (nil) se le asigna el valor de 0 por defecto
  before_save :set_minimum_stock

  # Comentario: Este es el método que se llama en el before_save(antes de guardar)
  def set_minimum_stock
    minimum_stock = 0 if minimum_stock.nil?
  end
  
  def restock?
    with_minimum_stock && stock < minimum_stock ? true : false
  end
end
