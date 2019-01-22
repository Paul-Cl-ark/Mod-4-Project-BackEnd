class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:register, :login]

  def register
    @user = User.create(first_name: user_params[:first_name], last_name: user_params[:last_name], email: user_params[:email], password: user_params[:password])
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, token: @token }, status: :created
    else
      render json: { error: 'Failed to create user' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, token: @token }, status: :accepted
    else
      render json:  { error: 'Access DENIED'}, status: :unauthorized
    end
  end

  def validate
    @user = current_user
    if @user
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, token: @token }
    else
      render json: { error: 'User not found' }, status: 404
    end
  end

  # def update
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
