class UsersController < ApplicationController
  # Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Indico el layout a utilizar para las vistas de este controlador
  layout 'general'

  # Este método "devuelve" a todos los usuarios registrados en la base de datos, en la tabla de users 
  def index
    @users = User.all
  end

  # Este método devuelve el usuario cuyo id de la tabla users corresponda al enviado como parametro (params[:id])
  def show
    @user = User.find(params[:id])
  end

end
