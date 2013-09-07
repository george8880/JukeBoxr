require 'net/http'
require 'open-uri'
require 'json'

class APIGetters
  def self.get_ll(address)
    #return business name
    client_id = "PZNJGDBGF4O34SXD0NYLMDWQDB1GA0M0WQK0V4SLO2I2A2I5"
    client_secret = "W1GROIHFC45H5WZSZHN023DACEMMTMLNGBF2JSHWBXBKMVWK"

    #--------------------------- Google Geocoder
    #ARGV[0] = address, ARGV[1] = business name
    g_url = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=" + URI::encode(address) + "&sensor=false")

    `puts g_url`

    res = JSON.parse(Net::HTTP.get(g_url))
    lat = res["results"].first["geometry"]["location"]["lat"]
    lng = res["results"].first["geometry"]["location"]["lng"]

    return {lat: lat, lng: lng}
  end
end




