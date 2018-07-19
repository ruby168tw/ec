class AddInstockToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :instock, :integer
  end
end
