class GamesController < ApplicationController
  def new
    @game = Game.new
  end
  
  def index
    @game = Game.all
  end
  
  def create
    @game = Game.new(game_params)
    
    @game.save
    redirect_to @game
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  private
  def game_params
    params.require(:game).permit(:title, :platform)
  end
end
