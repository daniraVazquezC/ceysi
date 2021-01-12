class QuantityAdjustmentsController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  # Comentario: Este método "devuelve" a todas las transacciones registradas con el tipo de venta(sale) en la base de datos, en la tabla de transacciones 
  def index
  end

  #Comentario: Este método devuelve la información de una venta especifica
  def show

  end

  def create
    @quantity_adjustment = QuantityAdjustment.new(quantity_adjustment_params.merge(user_id: current_user.id))
    @product = Product.find(5)
    if @quantity_adjustment.save
      flash[:notice] = "Ajuste registrado con éxito"
    else
      flash[:errors] = @outbound_order.errors.full_messages
    end
    redirect_to @product
  end

  private

    def quantity_adjustment_params
      params.require(:quantity_adjustment).permit(:comments, :adjustment_type, transaction_details_attributes: [:product_id, :quantity, :_destroy])
    end

end