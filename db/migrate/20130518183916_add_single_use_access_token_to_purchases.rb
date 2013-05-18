class AddSingleUseAccessTokenToPurchases < ActiveRecord::Migration
  def up
    change_table :purchases do |t|
      t.string :access_token
      t.integer :awarded_value
    end

    change_table :offers do |t|
      t.integer :value
    end

    change_table :users do |t|
      t.integer :points
    end
  end

  def down
    change_table :purchases do |t|
      t.remove :access_token
      t.remove :awarded_value
    end

    change_table :offers do |t|
      t.remove :value
    end

    change_table :users do |t|
      t.remove :points
    end
  end
end
