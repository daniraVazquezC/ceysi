class TransactionDetail < ApplicationRecord
  # Comentario: Esto indica una relación bidireccional con las transacciones en donde se indica que un "transaction_detail"
  # pertenece a una "transaction", esta parte deberia lucir asi 'belongs_to :transaction' pero 'transaction' es una 
  # palabra reservada de rails , por lo que se hace una declaracion diferente indicandole que se relaciona al modelo de transacciones pero
  # la relacion estara bajo el nombre de order
  belongs_to :order, foreign_key: "transaction_id", class_name: "Transaction"
  # Comentario: Esto indica una relación con los productos en donde se indica que un "transaction_detail"
  # pertenece a un "product"
  belongs_to :product
end
