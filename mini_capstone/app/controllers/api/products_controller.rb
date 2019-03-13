class Api::ProductsController < ApplicationController
  def index
    search_term = params[:search]
    if search_term
      @products = Product.where("name iLIKE ?", "%#{search_term}%")
    else
      @products = Product.all
    end

    

    if params[:discount] == "true"
      @products = @products.where("price < ?", 200)
    end

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
      description: params[:description] || @nothing,
      image_url: params[:image_url] || @nothing,
      supplier_id: params[:supplier_id] || @nothing
    )
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: unprocessible_entity
    end
    @product.save
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    @product.supplier_id = params[:supplier_id]
    if @product.save
      render 'show.json.jbuilder'
    else
      render 'error.json.jbuilder', status: unprocessible_entity
    end
    @product.save
  end

  def delete
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {message: "Product successfully deleted."}
  end
end
