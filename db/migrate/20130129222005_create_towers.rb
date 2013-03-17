class CreateTowers < ActiveRecord::Migration
  def change
    create_table :towers do |t|
      t.string :name
      t.integer :o_floors
      t.integer :h_floors

      t.timestamps
    end
  end
end
