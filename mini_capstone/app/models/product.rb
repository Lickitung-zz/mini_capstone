class Product < ApplicationRecord
  belongs_to :supplier
  has_many :users
  has_many :orders
  has_many :images

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :description, presence: true, length: { in: 10..500 }

  def is_discounted?
    if price < 10
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    return tax
  end

  def total
    total = tax + price
    return total
  end


  #def products
    #Product.where(supplier_id: id)
  #end
end
