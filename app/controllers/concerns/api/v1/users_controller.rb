class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:showRandom, :show,:update,:destroy]
  before_action :user_params, only: [:create,:update]

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
      render json: opponent, status: 200
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
    matchedUserNames = User.all.select { |userName| userName.name.downcase == user_params[:name].downcase }
    if matchedUserNames[0]
      user = nil
    else
      user = User.create(user_params)
      user[:token] = generate_token(user)
      p "I have arrived in the else"
      p user
    end
    render json: user, status: 201
  end

  def update
    if (authorized?(@user))
      @user.update(user_params)
      render json: @user, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  def destroy
    if (authorized?(@user))
      userDestroied = @user
      @user.destroy
      render json: userDestroied
    else
      render json: nil, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :password, :avatar, :main, :attack, :defence, :type1, :type2, :type3)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
