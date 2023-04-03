class UsersController < ApplicationController
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

  # User Delete
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User deleted!" }, request: 200
  end
end
