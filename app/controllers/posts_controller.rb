class PostsController < ApplicationController
  before_action :authenticate_user

  # users create post action
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

  # display all posts for a user
  def index
    @posts = current_user.posts.all
    render :index
  end

  # display a specific post for a user
  def show
    @post = current_user.posts.find_by(id: params[:id])
    render :show
  end

  # allow user to delete a post
  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    render json: { message: "Successfully deleted!" }
  end
end
