class User < ApplicationRecord
  # Comentario: 
  # modulos de devise utilizados en el sistema
  # database_authenticatable: almacena una contraseña en la bd para validad el inicio de sesión
  # recoverable: Permite al usuario restablecer su contraseña
  # rememberable: recordar al usuario de una cookie
  # invitable: modulo agregado con una gema extra que permite a los usuarios registrados "invitar" personas al sistema
  devise :invitable, :database_authenticatable, :recoverable, :rememberable

  # Comentario: Realiza la validación de que el correo electrónico este presente antes de crear el registro en la base de datos 
  validates :email, presence: true
  # Comentario: Valida que el email sea unico en la base de datos, sin importar mayusculas y minusculas
  validates_uniqueness_of :email, case_sensitive: false
  # Comentario: Si el nuevo usuario no cuenta con un nombre se le asignará uno por defecto
  before_save :set_name
  # Comentario: Esto indica una relacion con las transacciones en donde una "user" tiene o puede tener 
  # muchas "transactions"
  has_many :transactions

  # Comentario: Este es el método que se llama en el before_save(antes de guardar)
  def set_name
    self.name = "Usuario del sistema" if self.name.blank?
  end

  # Comentario: Este método indica si la cuenta del usuario esta o no activa para que inicie sesión en el sistema
  def active_for_authentication?
    super && self.active
  end

  def is_superuser?
    role == "superusuario"
  end

  def is_admin?
    role == "administrador"
  end
  
end
