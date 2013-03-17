class CreateInstallments < ActiveRecord::Migration
  def change
    create_table :installments do |t|
      t.integer :contract_id
      t.integer :amount
      t.date :date
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
