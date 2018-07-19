class AddSafetystockToProducts < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :safetystock, :integer
  end
end
