class RenameColumnInOrder < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :member_id, :user_id 
  end
end
