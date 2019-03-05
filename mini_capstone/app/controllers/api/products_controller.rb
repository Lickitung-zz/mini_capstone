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

  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jbuilder'
  end

  def create
    @nothing = "nothing was entered here"
    @product = Product.new(
      name: params[:name] || @nothing,
      price: params[:price] || @nothing,
      description: params[:description] || @nothing
    )
    @product.save
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url]
    @product.save
    render 'show.json.jbuilder'
  end

  def delete
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product successfully deleted."}
  end
end
