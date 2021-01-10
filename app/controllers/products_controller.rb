class ProductsController < ApplicationController
  # Comentario: Esta linea indica que antes de ejecutar cualquier metodo de este controlador se debe verificar que sea un usuario autenticado
  before_action :authenticate_user!
  # Comentario: Indica el layout a utilizar para las vistas de este controlador
  layout 'general'
  # Comentario: Define una accion a realizar antes de ejecutar ciertos metodos
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # Comentario: Devuelve el listado total de productos en la base de datos
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  # Comentario: este metodo crea el producto en la base de datos
  def create
    # Comentario: Se iguala el campo stock al de initial_stock
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Producto creado con éxito"
      redirect_to @product
    else
      flash[:errors] = @product.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Producto modificado con éxito"
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private
    # Comentario: Este metodo busca el producto en la base de datos basandose en el id en params
    def set_product
      @product = Product.find(params[:id])
    end

    # Comentario: Se toman los parametros enviados y se realiza la depuración de cuales de ellos van a permitirse
    def product_params
      params.require(:product).permit(:product_code, :name, :initial_stock, :price, :with_minimum_stock, :minimum_stock, :description)
    end
end
