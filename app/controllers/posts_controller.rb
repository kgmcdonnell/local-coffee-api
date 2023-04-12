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

  def index
    @posts = current_user.posts.all
    render :index
  end

  def show
    @post = current_user.posts.find_by(id: params[:id])
    render :show
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    render json: { message: "Successfully deleted!" }
  end
end
