require "http"
latitude = 28.009380
longitude = -80.682625
index = 0
response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{latitude},#{longitude}&radius=1000&region=us&type=bakery,cafe&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")
data = response.parse(:json)
id = data["results"][1]["place_id"]
response = HTTP.get("https://maps.googleapis.com/maps/api/place/details/json?&place_id=#{id}&fields=opening_hours,formatted_phone_number,rating&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")
details = response.parse(:json)
pp details
