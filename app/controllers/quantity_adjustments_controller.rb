class QuantityAdjustmentsController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  #Comentario: Este método devuelve la información de ajuste de cantidad especifico
  def show
    @quantity_adjustment = QuantityAdjustment.find(params[:id])
    @transaction_detail = @quantity_adjustment.transaction_details.first
  end

  def create
    @quantity_adjustment = QuantityAdjustment.new(quantity_adjustment_params.merge(user_id: current_user.id))
    @product = Product.find(@quantity_adjustment.transaction_details.first.product.id)
    if @quantity_adjustment.save
      StockMailer.send_notification(@quantity_adjustment)
      flash[:notice] = "Ajuste registrado con éxito"
    else
      flash[:errors] = @quantity_adjustment.errors.full_messages
    end
    redirect_to @product
  end

  private

    def quantity_adjustment_params
      params.require(:quantity_adjustment).permit(:comments, :adjustment_type, transaction_details_attributes: [:product_id, :quantity, :_destroy])
    end

end