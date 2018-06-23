class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :sn
      t.integer :user_id
      t.string :name
      t.string :phone
      t.string :address
      t.string :paid_status
      t.string :shipping_status

      t.timestamps
    end
  end
end
