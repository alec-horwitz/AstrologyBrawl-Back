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
    types = {
      "Aquarius" => 'air',
      "Gemini" => 'air',
      "Libra" => 'air',
      "Taurus" => 'earth',
      "Virgo" => 'earth',
      "Capricorn" => 'earth',
      "Pisces" => 'water',
      "Cancer" => 'water',
      "Scorpio" => 'water',
      "Aries" => 'fire',
      "Leo" => 'fire',
      "Sagittarius" => 'fire'
    }

    avatars = {
      "Aquarius" => 'https://onehdwallpaper.com/wp-content/uploads/2015/08/Aquarius-Horoscope-Desktop-Backgrounds.jpg',
      "Gemini" => 'https://www.englishclub.com/efl/wp-content/uploads/2011/07/03c-Gemini.png',
      "Libra" => 'https://1.bp.blogspot.com/-dVGP128g-ns/UbTyCKx2H9I/AAAAAAAAAl0/9DelDJUENCU/s1600/Libra.jpg',
      "Taurus" => 'https://2.bp.blogspot.com/_01YItv3gFfo/S8R4S2NwnMI/AAAAAAAAAJY/eqScVtI_Zb4/s1600/Taurus-Zodiac-Sign-1.jpeg',
      "Virgo" => 'https://1.bp.blogspot.com/-C3Wv_yKA4U8/TiRe7toN5lI/AAAAAAAACT4/HEm3QnRw1k4/s1600/virgo11.jpg',
      "Capricorn" => 'https://1.bp.blogspot.com/-vRML1Dg9ECg/UWg6fAv0EcI/AAAAAAAAFFo/3WaNG6V8j9s/s1600/zodiac1+capricorn.jpg',
      "Pisces" => 'https://4.bp.blogspot.com/-XAXArbVtBcY/UD9tPBPIfiI/AAAAAAAAIvY/ZVGw9jSoCoo/s1600/Pisces+Wallpapers.jpg',
      "Cancer" => 'https://4.bp.blogspot.com/-jF9rRjCTB-w/UI7svYw69uI/AAAAAAAATyM/X-2h4w_kQSg/s1600/4Cancer-Zodiac-Sign-1.jpeg',
      "Scorpio" => 'http://pixfeeds.com/images/18/463850/1200-614609158-scorpio-sign.jpg',
      "Aries" => 'https://2.bp.blogspot.com/_WeQf3HIdYws/S_YL1j9bncI/AAAAAAAAAAc/1M-mJkzfMng/s1600/aries.jpg',
      "Leo" => 'https://2.bp.blogspot.com/-1_2dylpfIqg/UV_hyTbRl_I/AAAAAAAAFAI/iZChMtwrNvo/s1600/Leo-Zodiac-Sign-1.jpeg',
      "Sagittarius" => 'https://2.bp.blogspot.com/-obkvSdEM3jY/UWaJwGUfL7I/AAAAAAAAFEc/fTgiP_0KJaE/s1600/Sagittarius.jpeg'
    }
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
        type1: types[user_create_params[:sign1]],
        type2: types[user_create_params[:sign2]],
        type3: types[user_create_params[:sign3]],
        avatar: avatars[user_create_params[:sign1]],
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
