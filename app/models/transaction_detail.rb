class TransactionDetail < ApplicationRecord
  # Comentario: Esto indica una relación bidireccional con las transacciones en donde se indica que un "transaction_detail"
  # pertenece a una "transaction", esta parte deberia lucir asi 'belongs_to :transaction' pero 'transaction' es una 
  # palabra reservada de rails , por lo que se hace una declaracion diferente indicandole que se relaciona al modelo de transacciones pero
  # la relacion estara bajo el nombre de order
  belongs_to :order, foreign_key: "transaction_id", class_name: "Transaction", inverse_of: :transaction_details
  # Comentario: Esto indica una relación con los productos en donde se indica que un "transaction_detail"
  # pertenece a un "product"
  belongs_to :product

  # Comentario: se valida que a antes de crear un registro de transaction details este tenga tanto un codigo de producto como cantidad
  validates :product_id, presence: true
  validates :quantity, presence: true
  # Comentario: Se define la llamada a un metodo, se ejecutara despues de crear un registro de este modelo
  after_save :update_product

  # Comentario: Se actualizan las existencias de un producto en base al tipo de orden al que esta asociado el detalle
  def update_product
    if order.type == "InboundOrder"
      product.update(stock: product.stock + quantity)
    else
      product.update(stock: product.stock - quantity)
    end
  end

end
