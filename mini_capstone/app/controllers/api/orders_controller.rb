class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create
    tax_rate = 0.09
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    render "show.json.jbuilder"
  end
end
