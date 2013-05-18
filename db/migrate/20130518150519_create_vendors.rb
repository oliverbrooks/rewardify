class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end

    add_index :vendors, :user_id
  end
end
