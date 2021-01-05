# Esta clase controla lo referente a las invitaciones de usuarios al sistema

class Users::InvitationsController < Devise::InvitationsController
  # Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Indico el layout a utilizar para las vistas de este controlador
  layout 'general'

end
