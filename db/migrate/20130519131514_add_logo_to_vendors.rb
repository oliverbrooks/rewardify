class AddLogoToVendors < ActiveRecord::Migration
  def change
    change_table :vendors do |t|
      t.string :logo
    end
  end
end
