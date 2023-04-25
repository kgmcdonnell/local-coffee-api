require "http"

response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=40,-122&radius=1000&region=us&type=bakery,cafe&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")
data = response.parse(:json)
pp data
