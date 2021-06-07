class Item < ApplicationRecord
      has_many :cart_items
  has_many :carts, through: :cart_items
end

#une instance du model cart sera liée forcément à un user 
#un cart a contient plusieurs items (pour ce MVP, nous ferons en sorte qu'un utilisateur ne choisisse pas la quantité d'items qu'il commande, qui sera toujours de 1)
#un item pourra être ajouté dans plusieurs carts