class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :facebook_id
      t.string :music_preferences

      t.timestamps
    end
  end
end
