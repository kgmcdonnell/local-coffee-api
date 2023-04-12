class QuotesController < ApplicationController
  before_action :authenticate_admin

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
end
