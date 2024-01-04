class CoffeeShopsController < ApplicationController
  before_action :authenticate_user

  # show all coffee shops based on user coordinates test
  def index
    lat = current_user.latitude
    lon = current_user.longitude
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{lat},#{lon}&radius=10000&region=us&type=cafe&key=#{Rails.application.credentials.google_api[:api_key]}")
    data = response.parse(:json)
    data = data["results"]
    chains = ["Starbucks", "Dunkin'", "Foxtail", "Dutch Bros Coffee", "Foxtail Coffee Bar"]
    data = data.delete_if { |x| chains.include? x["name"] }
    @coffee_shops = data
    render json: @coffee_shops
  end

  # show a specific coffee shop
  def show
    id = params[:id]
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/details/json?&place_id=#{id}&fields=name,formatted_address,opening_hours,formatted_phone_number,rating,website,photos,reviews&key=#{Rails.application.credentials.google_api[:api_key]}")
    @coffee_shop = response.parse(:json)
    render json: @coffee_shop
  end
end
