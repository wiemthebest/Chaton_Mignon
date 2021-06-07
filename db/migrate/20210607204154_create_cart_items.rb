class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
      t.timestamps
    end
  end
end
