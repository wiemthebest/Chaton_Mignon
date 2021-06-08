class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart
      # la table qui fait le lien avec " cart et item "
      t.belongs_to :item
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
