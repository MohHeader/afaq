class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :total_price
      t.integer :meter_price
      t.integer :unit_id
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :finishing_id
      t.string  :buyer_name
      t.string  :buyer_phone
      t.text    :note
      t.string  :file

      t.timestamps
    end
  end
end