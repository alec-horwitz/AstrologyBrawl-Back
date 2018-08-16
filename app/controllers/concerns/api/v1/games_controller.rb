class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: [:show,:update,:destroy]
  before_action :game_params, only: [:create,:update]

  def index
    games = Game.all
    render json: games, status: 200
  end

  def showPage
    if params[:page].to_i*10 != 0
      startIndex = (params[:page].to_i*10)
    else
      startIndex = 0
    end
    endIndex = startIndex + 9

    games = Game.all[startIndex, endIndex]

    render json: games, status: 200
  end

  def show
    render json: @game, status: 200
  end

  def create
    game = Game.create(game_params)
    render json: game, status: 201
  end

  def update
    @game.update(game_params)
    render json: @game, status: 200
  end

  def destroy
    gameDestroied = @game
    @game.destroy
    render json: gameDestroied
  end

  private

  def game_params
   params.permit(:playername, :score, :user_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
