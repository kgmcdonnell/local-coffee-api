class PostsController < ApplicationController
  before_action :authenticate_user

  def create
    @post = Post.new(
      image: params[:image],
      caption: params[:caption],
      coffee_shop_id: params[:coffee_shop_id],
      user_id: current_user.id,
    )
    if @post.save
      render :show
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end
end
