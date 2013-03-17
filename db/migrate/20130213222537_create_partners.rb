class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.integer :tower_id

      t.timestamps
    end
  end
end
