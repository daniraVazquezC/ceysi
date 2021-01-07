class PurchasesController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'

  before_action :set_transaction, only: [:show, :edit, :update, :destroy]


  # Comentario: Este método "devuelve" a todas las transacciones registradas con el tipo de compra(purchase) en la base de datos, en la tabla de transacciones 
  def index
    @purchases = Purchase.all
  end

  def show
  end

  def new
    
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.fetch(:transaction, {})
    end
end
