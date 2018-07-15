class ChangeColumnSnInOrders < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :sn, :text
  end
end
