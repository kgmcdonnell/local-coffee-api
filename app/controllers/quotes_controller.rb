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

  def destroy
    @quote = Quote.find_by(id: params[:id])
    @quote.destroy
    render json: { message: "Successfully deleted quote!" }, status: 200
  end
end
