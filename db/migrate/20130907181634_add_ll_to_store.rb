class AddLlToStore < ActiveRecord::Migration
  def change
    remove_column :stores, :foursquare_id, :string
    remove_column :stores, :lat, :string
    remove_column :stores, :lng, :string

    add_column :stores, :top_lat, :string
    add_column :stores, :bot_lat, :string
    add_column :stores, :left_lng, :string
    add_column :stores, :right_lng, :string
  end
end
