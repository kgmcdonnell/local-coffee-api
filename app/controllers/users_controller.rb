class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  # User Sign-Up
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city: params[:city],
      state: params[:state],
      picture: params[:picture],
    )

    if @user.save
      render json: { message: "User created!" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, request: :bad_request
    end
  end

  # Update User Profile Picture
  def update
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user.update(
        picture: params[:picture] || @user.picture,
      )
      render json: { message: "User updated!" }, status: 200
    else
      render json: { errors: "Unauthorized" }, status: 401
    end
  end

  # User Deletes their profile
  def destroy
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user.destroy
      render json: { message: "User deleted!" }, status: 200
    else
      render json: { errors: "Unauthorized" }, status: 401
    end
  end
end
