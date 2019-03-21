class Api::CartedProductsController < ApplicationController
  def index
    if current_user
      @carted_products = current_user.carted_products
      @carted_products = @carted_products.where(status: "carted")
      render 'index.json.jbuilder'
    else
      render json: []
    end
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      order_id: params[:order_id],
      status: "carted"
      )
    @carted_product.save
    render 'show.json.jbuilder'
  end
end
