class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:login, :update]

  def login
  end

  def register
    user = User.create(user_params)
    if user.valid?
      render json: { user: user }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
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
    params.permit(:first_name, :last_name, :email, :password)
  end

  def find_user
    @user = User.find_by(user_params)
  end
end
