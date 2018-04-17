class Api::V1::GamesController < ApplicationController

  def index
    games = Game.all
    render json: games
  end

  def create
    game = Game.create(game_params)
  end

  def game_params
   params.require(:game).permit(:playername, :score)
  end

end
