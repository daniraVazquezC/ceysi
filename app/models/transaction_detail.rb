class TransactionDetail < ApplicationRecord
  # Comentario: Esto indica una relación con las transacciones en donde se indica que un "transaction_detail"
  # pertenece a una "transaction"
  belongs_to :transaction
  # Comentario: Esto indica una relación con los productos en donde se indica que un "transaction_detail"
  # pertenece a un "product"
  belongs_to :product
end
