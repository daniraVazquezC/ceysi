class OutboundOrdersController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  # Comentario: Este método "devuelve" a todas las transacciones registradas con el tipo de venta(sale) en la base de datos, en la tabla de transacciones 
  def index
    @outbound_orders = OutboundOrder.all.order(created_at: :desc)
  end

  #Comentario: Este método devuelve la información de una venta especifica
  def show
    @outbound_order = OutboundOrder.find(params[:id])
    @transaction_details = @outbound_order.transaction_details
  end

  def new
    @outbound_order = OutboundOrder.new
    @products = Product.all
  end

  def create
    @outbound_order = OutboundOrder.new(outbound_order_params.merge(user_id: current_user.id))
    if @outbound_order.save
      flash[:notice] = "Orden de egreso registrada con éxito"
      redirect_to outbound_orders_path
    else
      @products = Product.all
      flash[:errors] = @outbound_order.errors.full_messages
      render :new
    end

  end

  private

    def outbound_order_params
      params.require(:outbound_order).permit(:comments, transaction_details_attributes: [:product_id, :quantity, :_destroy])
    end
end
