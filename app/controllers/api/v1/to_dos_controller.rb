class Api::V1::ToDosController < ApplicationController
  before_action :find_to_do, only: [:update, :destroy]

  def index
    user = User.find(params[:user_id])
    to_dos = user.to_dos
    render json: to_dos
  end

  def create
    to_do = ToDo.create(header: to_do_params[:header], description: to_do_params[:description], user_id: to_do_params[:user_id])
    if to_do.save
      render json: to_do, status: :accepted
    else
      render json: { errors: to_do.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    to_do.update(header: to_do_params[:header], description: to_do_params[:description], user_id: to_do_params[:user_id])
    if to_do.save
      render json: to_do, status: :accepted
    else
      render json: { errors: to_do.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    to_do.destroy
  end

  private

  def to_do_params
    params.permit(:header, :description, :user_id)
  end

  def find_to_do
    to_do = ToDo.find(params[:id])
  end
end
