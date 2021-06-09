class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_product(product)
    item = cart_items.find_by(item: item)

    if item
      item.quantity += 1
    else
      item = cart_items.new(item: item)
    end

    item
  end

  def total
    cart.items.to_a.sum(&:total)
  end

end
