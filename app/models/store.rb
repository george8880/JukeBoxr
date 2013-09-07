class Store < ActiveRecord::Base
  attr_accessible :name, :foursquare_id, :lat, :lng
end
