require "http"
latitude = 28.009380
longitude = -80.682625
response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{latitude},#{longitude}&radius=1000&region=us&type=bakery,cafe&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")

data = response.parse(:json)
name = data["results"][1]["name"]
address = data["results"][0]["formatted_address"]
pp name
pp address

id = data["results"][1]["place_id"]
response = HTTP.get("https://maps.googleapis.com/maps/api/place/details/json?&place_id=#{id}&fields=opening_hours,formatted_phone_number,rating&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")
details = response.parse(:json)

# Opening Hours
hours = details["result"]["opening_hours"]["weekday_text"]
puts "Opening Hours: "
puts hours

# Phone Number:
number = details["result"]["formatted_phone_number"]
puts "Phone Number: #{number}"

# Rating
rating = details["result"]["rating"]
puts "Rating: #{rating}"
