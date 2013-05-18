class AddVendorIdToOffers < ActiveRecord::Migration
  def change
    change_table :offers do |t|
      t.integer :vendor_id
    end

    add_index :offers, :vendor_id
  end
end
