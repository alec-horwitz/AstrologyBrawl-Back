require_relative '../../constants.rb'

class ApplicationController < ActionController::API

  def token_json(user)
    {
      user: user,
      token: generate_token(user),
      # audio: MENU[:music]
    }
  end

  def generate_token(user)
    user_id = user.id
    JWT.encode({ user_id: user_id }, ENV["JWT_PASSWORD"], "HS256" )
  end

  def try_decode_token
    token = request.headers["Authorization"]
    begin
      decoded = JWT.decode(token, ENV["JWT_PASSWORD"], true, { algorithm: 'HS256' })
    rescue JWT::VerificationError
      return nil
    end
    decoded
  end

  def valid_token?
    !!try_decode_token
    # token = request.headers["Authorization"]
    # begin
    #   decoded = JWT.decode(token, ENV["JWT_PASSWORD"], true, { algorithm: 'Hs256' })
    # rescue JWT::VerificationError
    #   return false
    # end
    # true
  end

  def current_user_id
    decoded = try_decode_token

    if decoded && decoded[0] && decoded[0]["user_id"]
      decoded[0]["user_id"]
    else
      return nil
    end
  end

  def authorized?(user)
    current_user_id == user.id
  end

end
