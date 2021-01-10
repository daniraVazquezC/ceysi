class InboundOrdersController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  # Comentario: Este método "devuelve" a todas las transacciones registradas con el tipo de venta(sale) en la base de datos, en la tabla de transacciones 
  def index
    @inbound_orders = InboundOrder.all.order(created_at: :desc)
  end

  #Comentario: Este método devuelve la información de una venta especifica
  def show
    @inbound_order = InboundOrder.find(params[:id])
    @transaction_details = @inbound_order.transaction_details
  end

  def new
    @inbound_order = InboundOrder.new
    @products = Product.all
  end

  # TODO : el sistema debe rechazar crear la orden si no lleva al menos un producto asociado

  def create

    @inbound_orders = InboundOrder.new(inbound_order_params.merge(user_id: current_user.id))
    if @inbound_orders.save
      flash[:notice] = "Orden de ingreso registrada con éxito"
      redirect_to inbound_orders_path
    else
      @products = Product.all
      flash[:errors] = @inbound_orders.errors.full_messages
      render :new
    end

  end

  private

    def inbound_order_params
      params.require(:inbound_order).permit(:comments, transaction_details_attributes: [:product_id, :quantity, :_destroy])
    end
end
