class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :users, foreign_key: true
      t.string :name, null: false
      t.text :address, null: false
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.references :carts, foreign_key: true
      # cette table qui fait le lien avec user 
      t.timestamps
    end
  end
end

#Pour enregistrer toutes les commandes en base, 
#il faut une table order. 
#Un utilisateur peut effectuer plusieurs commandes,
# mais une commande ne concerne qu'un seul utilisateur.
# Une commande peut contenir plusieurs produits, et 
#un produit peut avoir été commandé plusieurs fois.