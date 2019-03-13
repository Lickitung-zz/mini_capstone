class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render "index.json.jbuilder"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.json.jbuilder"
  end
end
