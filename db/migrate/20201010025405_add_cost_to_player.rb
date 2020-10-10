class AddCostToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :cost, :integer
  end
end
