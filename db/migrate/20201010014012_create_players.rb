class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :role
      t.integer :qta
      t.integer :qti
      t.string :team

      t.timestamps
    end
  end
end
