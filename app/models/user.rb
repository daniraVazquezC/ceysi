class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable

  # modulos de devise utilizados en el sistema
  # database_authenticatable: almacena una contraseña en la bd para validad el inicio de sesión
  # recoverable: Permite al usuario restablecer su contraseña
  # rememberable: recordar al usuario de una cookie
  # invitable: modulo agregado con una gema extra que permite a los usuarios registrados "invitar" personas al sistema
  devise :invitable, :database_authenticatable, :recoverable, :rememberable
end
