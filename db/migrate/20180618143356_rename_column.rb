class RenameColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :user_id, :member_id
  end
end
