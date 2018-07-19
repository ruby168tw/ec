class CreateReplenishes < ActiveRecord::Migration[5.1]
  def change
    create_table :replenishes do |t|
      t.integer :replenish
      t.integer :product_id

      t.timestamps
    end
  end
end
