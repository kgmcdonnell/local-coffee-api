class CoffeeShopsController < ApplicationController
  before_action :authenticate_user

  # show all coffee shops based on user coordinates
  def index
    lat = current_user.latitude
    lon = current_user.longitude
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{lat},#{lon}&radius=10000&region=us&type=cafe&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")

    @coffee_shops = response.parse(:json)
    render json: @coffee_shops
  end

  # show a specific coffee shop
  def show
    id = params[:id]
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/details/json?&place_id=#{id}&fields=name,formatted_address,opening_hours,formatted_phone_number,rating,website&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")
    @coffee_shop = response.parse(:json)
    render json: @coffee_shop
  end
end
