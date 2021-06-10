class Item < ApplicationRecord
  has_many :carts, through: :line_items
  has_many :line_items, dependent: :nullify

  validates :title, uniqueness: {case_sensitive: false} , presence: true, length: {in: 2..25}
  validates :description, presence: true, length: {in: 12..700}
  validates :price, presence: true, numericality: { greater_than: 0}
  validates :image_url, presence: true, format: { with: /\.(jpg|jpeg|png|gif)\z/i, message:"doit être en format jpg, png ou gif"}, allow_blank: true
  

end

#une instance du model cart sera liée forcément à un user 
#un cart a contient plusieurs items (pour ce MVP, nous ferons en sorte qu'un utilisateur ne choisisse pas la quantité d'items qu'il commande, qui sera toujours de 1)
#un item pourra être ajouté dans plusieurs carts