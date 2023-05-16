class QuotesController < ApplicationController
  before_action :authenticate_admin, except: [:index]

  def index
    @quotes = Quote.all
    render json: @quotes.as_json
  end

  # allow admins to create a quote
  def create
    @quote = Quote.new(
      text: params[:text],
      author: params[:author],
    )
    if @quote.save
      render :show
    else
      render json: { message: @quote.errors.full_messages }, status: :bad_request
    end
  end

  # allow admins to delete a quote
  def destroy
    @quote = Quote.find_by(id: params[:id])
    @quote.destroy
    render json: { message: "Successfully deleted quote!" }, status: 200
  end
end
