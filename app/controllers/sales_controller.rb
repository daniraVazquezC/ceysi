class SalesController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'
    
  # Comentario: Este método "devuelve" a todas las transacciones registradas con el tipo de venta(sale) en la base de datos, en la tabla de transacciones 
  def index
    @sales = Sale.all
  end

  #Comentario: Este método devuelve la información de una venta especifica
  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def create
    binding.pry
  end

  private

    def sale_params
      
    end
end
