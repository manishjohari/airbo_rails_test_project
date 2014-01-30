class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.integer :customer_id, null: false
      t.integer :created, null: false
      t.boolean :paid, null: false
      t.integer :amount, null: false
      t.string :currency, null: false
      t.boolean :refunded, null: false
      t.foreign_key :customers
    end

    add_index :charges, :customer_id
  end
end
