class Order < ApplicationRecord
  belongs_to :user

  enum status: [:ordered, :payed, :in_progress, :sent]

  validates :name, :address, :email, presence: true
  validates :status, inclusion: statuses.keys
end

#Pour enregistrer toutes les commandes en base, 
#il faut une table order. 
#Un utilisateur peut effectuer plusieurs commandes,
# mais une commande ne concerne qu'un seul utilisateur.
# Une commande peut contenir plusieurs produits, et 
#un produit peut avoir été commandé plusieurs fois.