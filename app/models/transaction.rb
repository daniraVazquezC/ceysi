class Transaction < ApplicationRecord
  # Comentario: Esto indica una relación bidireccional con los usuarios en donde se indica que una "transaction"
  # pertenece a un "user"
  belongs_to :user
  # Comentario: Esto indica una relacion con los detalles de transacciones en donde una "transaction" tiene o puede tener 
  # muchos "transaction_detail", se agrega el inverse_of para que reconozca la relacion bidireccional hecha de una forma no estandar con transaction_details
  has_many :transaction_details, inverse_of: 'order', dependent: :destroy

  # Comentario: Con esto se le indica al modelo que se van a aceptar atributos anidados que pertenecen al modelo de transaction_details
  accepts_nested_attributes_for :transaction_details, reject_if: :all_blank, allow_destroy: true
  validates :transaction_details, presence: true

  #Comentario: Esto se agrega para poder definir el tipo de ajuste de cantidades
  attr_accessor :adjustment_type

end


