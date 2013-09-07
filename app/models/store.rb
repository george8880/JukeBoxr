require 'script/APIGetters'

class Store < ActiveRecord::Base
  attr_accessible :name, :lat, :lng, :top_lat, :bottom_lat, :left_lng, :right_lng

  def self.get_nearby_stores(lat, lng)
    return Store.all.inject([]) { |result, store|
      if (lat <= store.top_lat && lat >= store.bottom_lat &&
            lng <= store.right_lng && lng >= store.left_lng)
        result << store
        result
      end
    }
  end

  def self.create_store_with_addr(addr)
    ll_hash = APIGetters.get_ll(addr)
    s = ""
  end
end
