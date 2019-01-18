class Api::V1::ToDosController < ApplicationController

  def index
    # user = User.find(params[:user_id])
    # to_dos = user.to_dos
    to_dos = ToDo.all
    render json: to_dos
  end

  def create
    to_do = ToDo.create(header: params[:header], description: params[:description])
    if to_do.save
      render json: to_do
    else
      render json: { errors: to_do.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    to_do = ToDo.find(params[:id])
    to_do.update(header: params[:header], description: params[:description])
    if to_do.save
      render json: to_do, status: :accepted
    else
      render json: { errors: to_do.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    to_do = ToDo.find(params[:id])
    to_do.destroy()
  end

end
