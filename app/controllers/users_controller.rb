class UsersController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  # Comentario: Este método "devuelve" a todos los usuarios registrados en la base de datos, en la tabla de users 
  def index
    @users = User.all
  end

  # Comentario: Este método devuelve el usuario cuyo id de la tabla users corresponda al enviado como parametro (params[:id])
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  # Comentario: En este método se crea el usuario
  def create
    user = User.create(user_params.merge(active: true))
    if user.valid?
      user.invite!(current_user)
      flash[:notice] = "Usuario creado con exito, una invitación será enviada al correo del usuario"
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  # Comentario: En este metodo se actualiza el usuario
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "Usuario actualizado con éxito"
      redirect_to users_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edith_user_path
    end
  end

  private
    # Comentario: Se toman los parametros enviados y se realiza la depuración de cuales de ellos van a permitirse
    def user_params
      user = params.require(:user).permit(:name, :email, :role, :active)
    end

end
