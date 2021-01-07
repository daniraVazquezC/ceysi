class Transaction < ApplicationRecord
  # Comentario: Esto indica una relación con los usuarios en donde se indica que una "transaction"
  # pertenece a un "user"
  belongs_to :user
  # Comentario: Esto indica una relacion con los detalles de transacciones en donde una "transaction" tiene o puede tener 
  # muchos "transaction_detail"
  has_many :transaction_detail
end
