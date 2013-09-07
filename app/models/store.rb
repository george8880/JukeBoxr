require 'APIGetters'

class Store < ActiveRecord::Base
  attr_accessible :name, :top_lat, :bot_lat, :left_lng, :right_lng

  def self.get_nearby_stores(lat, lng)
    return Store.all.inject([]) { |result, store|
      if (lat <= store.top_lat && lat >= store.bot_lat &&
            lng <= store.right_lng && lng >= store.left_lng)
        result << store
        result
      end
    }
  end

  def self.create_store_with_addr(addr, name)
    ll_hash = APIGetters.get_ll(addr)
    lat = ll_hash[:lat].to_f
    lng = ll_hash[:lng].to_f

    Store.create(name: name, top_lat: (lat + 0.005), bot_lat: (lat - 0.005), left_lng: (lng - 0.005), right_lng: (lng + 0.005))
  end
end
