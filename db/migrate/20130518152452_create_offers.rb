class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :image
      t.string :name
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
