class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :number
      t.integer :tower_id
      t.string :floor
      t.integer :standard_price
      t.integer :partner_id
      t.string  :u_type

      t.timestamps
    end
  end
end