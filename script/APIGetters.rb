require 'net/http'
require 'open-uri'
require 'json'

#return business name
client_id = "PZNJGDBGF4O34SXD0NYLMDWQDB1GA0M0WQK0V4SLO2I2A2I5"
client_secret = "W1GROIHFC45H5WZSZHN023DACEMMTMLNGBF2JSHWBXBKMVWK"

#--------------------------- Google Geocoder
#ARGV[0] = address, ARGV[1] = business name
g_url = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?address=" + URI::encode(ARGV[0]) + "&sensor=false")

res = JSON.parse(Net::HTTP.get(g_url))
lat = res["results"].first["geometry"]["location"]["lat"]
lng = res["results"].first["geometry"]["location"]["lng"]

#--------------------------- Foursquare 
business_name = ARGV[1]

f_url = URI.parse("https://api.foursquare.com/v2/venues/search?ll=" + lat.to_s + "," + lng.to_s + "&client_id=" + client_id + "&client_secret=" + client_secret + "&v=20130906")

http = Net::HTTP.new(f_url.host, f_url.port)
http.use_ssl = true
request = Net::HTTP::Get.new(f_url.request_uri)
response = http.start {|http| http.request(request)}

v = nil
d = 9999
venue_res = JSON.parse(response.body) # To get body of response
venue_res["response"]["venues"].each { |venue|
   puts Rosetta.levenshtein_distance(venue["name"], business_name)
}



