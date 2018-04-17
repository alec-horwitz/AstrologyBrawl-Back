class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: :show


  def index
    pokemons = Pokemon.all
    render json: pokemons
  end

  def show
    render json: pokemon
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

end
