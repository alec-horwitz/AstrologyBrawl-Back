class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:showRandom, :show,:update,:destroy]
  before_action :user_params, only: [:create,:update]

  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    render json: @user, status: 200
  end

  def showRandom
    allUsers = User.all.select { |opponent| opponent.id != @user.id }
    opponent = allUsers[Random.rand(allUsers.length)]
    render json: opponent, status: 200
  end

  def showUser
    matchedUserNames = User.all.select { |userName| userName.name == params[:username] }
    matchedUsers = matchedUserNames.select { |userPassword| userPassword.password == params[:password]}
    render json: matchedUsers[0], status: 200
  end

  def create
    matchedUserNames = User.all.select { |userName| userName.name.downcase == params[:name].downcase }
    if matchedUserNames[0]
      user = nil
    else
      user = User.create(user_params)
      user[:token] = generate_token(user)
    end
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

  def generate_token(user)
    user_id = user.id
    JWT.encode({ user_id: user_id }, "super", "HS256" )

  end

  def user_params
    params.permit(:name, :password, :avatar, :main, :attack, :defence, :type1, :type2, :type3)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
