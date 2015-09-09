class ProductsController < ApplicationController
  def index
  	@products = Product.all 
  end

  def show
  	@product = Product.find_by(id: params[:id])
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.find_by(id: params[:id])
  end

  def create
  	@product = Product.new(product_params)

  	if @product.save
  		redirect_to products_path
  	else
  		render :new
  	end
  end

  def update
  	@product = Product.find_by(id: params[:id])

  	if @product.update_attributes(product_params)
  		redirect_to products_path(@product)
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find_by(id: params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  private
  def product_params
  	params.require(:product).permit(:name, :description, :price_in_cents)
  end

end
