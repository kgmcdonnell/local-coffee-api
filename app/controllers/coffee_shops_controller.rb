class CoffeeShopsController < ApplicationController
  before_action :authenticate_user

  def index
    latitude = 40
    longitude = -122
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shop&location=#{latitude},#{longitude}&radius=10000&region=us&type=bakery,cafe&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")

    @coffee_shops = response.parse(:json)
    render json: @coffee_shops
  end

  def show
    id = params[:id]
    response = HTTP.get("https://maps.googleapis.com/maps/api/place/details/json?&place_id=#{id}&fields=name,formatted_address,opening_hours,formatted_phone_number,rating,website&key=#{ENV["GOOGLE_PLACES_API_KEY"]}")
    @coffee_shop = response.parse(:json)
    render json: @coffee_shop
  end
end
