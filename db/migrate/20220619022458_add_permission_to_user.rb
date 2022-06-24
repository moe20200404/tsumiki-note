class AddPermissionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :permission, :boolean,default: false, null: false
  end
end
