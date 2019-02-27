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
end
