class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show,:update,:destroy]
  before_action :user_params, only: [:create,:update]

  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def create
    user = User.create(user_params)
    render json: user, status: 201
  end

  def update
    @user.update(user_params)
    render json: @user, status: 200
  end

  def destroy
    userDestroied = @user
    @user.destroy
    render json: userDestroied
  end

  private

  def user_params
    params.permit(:name, :password, :avatar, :main, :attack, :defence, :type1, :type2, :type3)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
