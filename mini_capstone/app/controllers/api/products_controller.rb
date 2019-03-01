class Api::ProductsController < ApplicationController
  def rock
    @product1 = Product.first
    render 'rock.json.jbuilder'
  end

  def leaf
    @product2 = Product.second
    render 'leaf.json.jbuilder'
  end

  def stick
    @product3 = Product.third
    render 'stick.json.jbuilder'
  end

  def all_products
    @products = Product.all
    render 'products.json.jbuilder'
  end

  def any_product
    the_id = params[:product_id]
    @product = Product.find_by(id: the_id)
    render 'any_product.json.jbuilder'
  end
end
