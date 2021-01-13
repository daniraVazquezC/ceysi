class UsersController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'
  # Comentario: Define una accion a realizar antes de ejecutar ciertos metodos
  before_action :set_user, only: [:show, :edit, :update]

  # Comentario: Este método "devuelve" a todos los usuarios registrados en la base de datos, en la tabla de users 
  def index
    @search = User.ransack(params[:q])
    @users = @search.result.order(created_at: :desc).page(params[:page])
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
  end

  # Comentario: En este metodo se actualiza el usuario
  def update
    if @user.update(user_params)
      flash[:notice] = "Usuario actualizado con éxito"
      redirect_to users_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edith_user_path
    end
  end

  private

    # Comentario: Este metodo busca el usuario en la base de datos basandose en el id en params
    def set_user
      @user = User.find(params[:id])
    end
    
    # Comentario: Se toman los parametros enviados y se realiza la depuración de cuales de ellos van a permitirse
    def user_params
      params.require(:user).permit(:name, :email, :role, :active)
    end

end
