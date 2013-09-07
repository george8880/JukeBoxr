class Customer < ActiveRecord::Base
  attr_accessible :name, :facebook_id, :music_preferences
end