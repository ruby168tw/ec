class RenameColumnInOrders < ActiveRecord::Migration[5.1]
  def change
  	rename_column :orders, :name, :buyer
  end
end
