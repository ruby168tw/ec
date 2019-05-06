class Rename < ActiveRecord::Migration[5.1]
  def change
    rename_column(:replenishes, :replenish, :add)
  end
end
