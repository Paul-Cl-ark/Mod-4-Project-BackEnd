class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:login, :update]

  def login
    @user
  end

  def register
    User.create(user_params)
  end

  # def update
  #   user.update(user_params)
  #   if user.save
  #     render json: user, status: :accepted
  #   else
  #     render json: { errors: user.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password_digest)
  end

  def find_user
    @user = User.find_by(user_params)
  end
end
