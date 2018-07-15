class AddProductnameToOrderItems < ActiveRecord::Migration[5.1]
  def change
  	add_column :order_items, :productname, :string
  end
end
