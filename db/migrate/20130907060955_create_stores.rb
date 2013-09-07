class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :lat
      t.string :lng
      t.string :foursquare_id

      t.timestamps
    end
  end
end
