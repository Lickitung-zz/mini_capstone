class Product < ApplicationRecord
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
end
