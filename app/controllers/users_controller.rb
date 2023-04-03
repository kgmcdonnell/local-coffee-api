class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  # User Sign-Up
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )

    if @user.save
      render json: { message: "User created!" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, request: :bad_request
    end
  end

  # User Deletes their profile
  def destroy
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user.destroy
      render json: { message: "User deleted!" }, request: 200
    else
      render json: { errors: "Unauthorized" }, status: 401
    end
  end
end
