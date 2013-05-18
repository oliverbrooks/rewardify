class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :value
      t.text :notes
      t.integer :user_id
      t.integer :vendor_id

      t.timestamps
    end

    add_index :purchases, :user_id
    add_index :purchases, :vendor_id
  end
end
