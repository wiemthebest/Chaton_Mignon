class Item < ApplicationRecord
  validates :title, presence: true, length: {in: 2..25}
  validates :description, presence: true, length: {in: 12..700}
  validates :image_url, presence: true
  validates :price, presence: true, numericality: { greater_than: 0}
  has_many :carts, through: :cart_items
  has_many :cart_items, dependent: :nullify


end

#une instance du model cart sera liée forcément à un user 
#un cart a contient plusieurs items (pour ce MVP, nous ferons en sorte qu'un utilisateur ne choisisse pas la quantité d'items qu'il commande, qui sera toujours de 1)
#un item pourra être ajouté dans plusieurs carts