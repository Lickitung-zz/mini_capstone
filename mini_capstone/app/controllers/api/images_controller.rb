class Api::ImagesController < ApplicationController
  def index
    if params[:search_product_id]
      @images = Product.find_by("product_id iLIKE ?", "%#{params[:search_product_id]}%")
    else
      @images = Image.all
    end
    render "index.json.jbuilder"
  end

  def update
    @image = Image.find_by(id: params[:id])
    @image.product_id = params[:product_id] || @image.product_id
    @image.url = params[:url] || @image.url
    @image.save
  end

  def show
    @image = Image.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @image = Image.create(
      url: params[:url],
      product_id: params[:product_id],
    )
    render "show.json.jbuilder"
  end 

  def delete
    @image = Image.find_by(id: params[:id])
    @image.destroy
    render json: {message: "Image removed."}
  end
end
