class CoffeeShopsController < ApplicationController
  def index
    @coffee_shops = CoffeeShop.all
    render json: @coffee_shops.as_json
  end

  def show
    @coffee_shop = CoffeeShop.find_by(id: params[:id])
    render json: @coffee_shop.as_json
  end

  def create
    @coffee_shop = CoffeeShop.new(
      name: params[:name],
      city: params[:city],
      state: params[:state],
      address: params[:address],
      number: params[:number],
      logo: params[:logo],
    )

    if @coffee_shop.save
      render json: @coffee_shop.as_json
    else
      render json: { errors: @coffee_shop.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @coffee_shop = CoffeeShop.find_by(id: params[:id])
    @coffee_shop.destroy
    render json: { message: "Successfully deleted local coffee shop!" }, status: 200
  end
end
