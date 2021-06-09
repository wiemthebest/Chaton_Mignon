class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_product(product)
    item = cart_items.find_by(product: product)

    if item
      item.quantity += 1
    else
      item = cart_items.new(product: product)
    end

    item
  end
end
