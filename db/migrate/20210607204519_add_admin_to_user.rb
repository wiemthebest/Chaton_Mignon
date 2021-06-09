class AddAdminToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false
    #on ajout une colonne pour admin  
  end
end
