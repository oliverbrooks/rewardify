class AddOffersToPurchases < ActiveRecord::Migration
  def change
    change_table :purchases do |t|
      t.integer :offer_id
    end

    add_index :purchases, :offer_id
  end
end
