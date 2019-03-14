class Api::OrdersController < ApplicationController
  def create
    @order = Order.create(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity]
    )
    render "index.json.jbuilder"
  end
end
