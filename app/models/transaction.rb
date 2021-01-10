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


  # TODO : Pendiente de revisar 
   # Comentario: Si el campo de user_id va con un valor nulo (nil) se le asigna el valor del id del usuario actual
  #before_save :set_user_id

  # Comentario: Este es el método que se llama en el before_save(antes de guardar)
  #def set_user_id
  #  user_id = current_user.id if user_id.nil?
 # end

end


