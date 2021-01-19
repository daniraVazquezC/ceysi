class SettingsController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  def index
    @settings = set_stock_notice_emails
    if @settings.nil?
      @settings = Setting.new()
    end
  end

  def update
    setting = set_stock_notice_emails
    if setting.nil?
      @settings = Setting.create(key: "stock_notice_emails", value: settings_params[:value])
      flash[:notice] = "Configuración creada con éxito"
      redirect_to root_path
    else
      setting.update(value: settings_params[:value])
      flash[:notice] = "Configuración guardada con éxito"
      redirect_to root_path
    end
  end

  private
    
    def set_stock_notice_emails
      Setting.find_by(key: "stock_notice_emails")
    end

    def settings_params
      params.require(:setting).permit(:value)
    end

end
