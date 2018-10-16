require_relative '../../../../../constants.rb'

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:showRandom, :show,:update,:destroy]
  before_action :user_create_params, only: :create
  before_action :user_update_params, only: :update

  def index
    if (authorized?(@user))
      users = User.all
      render json: users, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  def show
    if (authorized?(@user))
      render json: @user, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  def showRandom
    if (authorized?(@user))
      allUsers = User.all.select { |opponent| opponent.id != @user.id }
      opponent = allUsers[Random.rand(allUsers.length)]
      arena_image = ARENA_IMAGE[@user.type1.to_sym][opponent.type1.to_sym]
      arena_color = ARENA_COLOR[@user.type1.to_sym][opponent.type1.to_sym]
      render json: {opponent: opponent, arena_image: arena_image, arena_color: arena_color}, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  # def showUser
  #   if (authorized?(@user))
  #     matchedUserNames = User.all.select { |userName| userName.name == params[:name] }
  #     matchedUsers = matchedUserNames.select { |userPassword| userPassword.password == params[:password]}
  #     render json: matchedUsers[0], status: 200
  #   else
  #     render json: nil, status: :unauthorized
  #   end
  # end

  def create
    # user_params = {name:"Test3", password:"test123", avatar:"https://1.bp.blogspot.com/-vRML1Dg9ECg/UWg6fAv0EcI/AAAAAAAAFFo/3WaNG6V8j9s/s1600/zodiac1+capricorn.jpg", main:"15", attack:"5", defence:"5", type1:"earth", type2:"water", type3:"air"}
    matchedUserNames = User.all.select { |userName| userName.name.downcase == user_create_params[:name].downcase }
    token = nil
    if matchedUserNames[0]
      user = nil
    else
      user = User.create(user_create_params.merge({
        status: "Your Turn",
        animation: "pulse",
        visible: "true",
        hp: "100",
        defending: "false",
        charged: "false",
        type1: SIGNS[user_create_params[:sign1]][:type],
        type2: SIGNS[user_create_params[:sign2]][:type],
        type3: SIGNS[user_create_params[:sign3]][:type],
        avatar: SIGNS[user_create_params[:sign1]][:avatar],
        main: 15,
        attack: 5,
        defence: 5
        }))
      if user.id == nil
        user = nil
      else
        token = generate_token(user)
      end
    end
    render json: {user: user, token: token}, status: 201
  end

  def update
    if (authorized?(@user))
      @user.update(user_update_params)
      render json: @user, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  # def destroy
  #   if (authorized?(@user))
  #     userDestroied = @user
  #     @user.destroy
  #     render json: userDestroied
  #   else
  #     render json: nil, status: :unauthorized
  #   end
  # end

  private

  def user_create_params
    params.permit(:name, :password, :password_confirmation, :email, :sign1, :sign2, :sign3)
  end

  def user_update_params
    params.permit(:name, :password, :password_confirmation, :email, :level, :experience, :points, :score, :active_slot, :inventory)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
