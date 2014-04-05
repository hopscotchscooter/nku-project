class GamesController < ApplicationController
  def new
    @game = Game.new
  end
  
  def index
    @games = Game.all
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully deleted.'
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
