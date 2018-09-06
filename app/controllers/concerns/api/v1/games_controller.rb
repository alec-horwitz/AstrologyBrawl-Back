class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: [:show,:update,:destroy]
  before_action :game_params, only: [:create,:update]

  # def index
  #   if (valid_token?)
  #     games = Game.all
  #     render json: games, status: 200
  #   else
  #     render json: nil, status: :unauthorized
  #   end
  # end

  def showPage
    if (valid_token?)
      if params[:page].to_i*10 != 0
        startIndex = (params[:page].to_i*10)
        games = Game.all[startIndex, 10]
      else
        startIndex = 0
        games = Game.all[startIndex, 10]
      end
      render json: games, status: 200
    else
      render json: nil, status: :unauthorized
    end

  end

  def showNumPages
    if (valid_token?)
      if Game.all.length == 0
        pages = Game.all.length/10
      else
        pages = (Game.all.length-1)/10
      end

      render json: pages, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  def show
    if (valid_token?)
      render json: @game, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  def create
    if (valid_token?)
      game = Game.create(game_params)
      render json: game, status: 201
    else
      render json: nil, status: :unauthorized
    end
  end

  def update
    if (valid_token?)
      @game.update(game_params)
      render json: @game, status: 200
    else
      render json: nil, status: :unauthorized
    end
  end

  # def destroy
  #   if (valid_token?)
  #     gameDestroied = @game
  #     @game.destroy
  #     render json: gameDestroied
  #   else
  #     render json: nil, status: :unauthorized
  #   end
  # end

  private

  def game_params
   params.permit(:winner_name, :score, :user_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
