class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:register]

  def register
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :created
    else
      render json: { error: 'Failed to create user' }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user && @user.authenticate(user_params[:password])
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, status: :accepted
    else
      render json:  { error: 'Access DENIED'}, status: :unauthorized
    end
  end

  # def update
  # end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
