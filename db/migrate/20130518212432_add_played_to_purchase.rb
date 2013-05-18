class AddPlayedToPurchase < ActiveRecord::Migration
  def change
    change_table :purchases do |t|
      t.boolean :played, default: false
    end

    add_index :purchases, :access_token
  end
end
