class GamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_owns_game, only: [:show, :edit, :update]

  def index
    @games = current_user.games
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = current_user.games.new(params[:game])
    if @game.save
      redirect_to games_path
    else
      render 'new'
    end
  end

  def update
    @game = current_user.games.find(params[:id])
    if @game.update_attributes(params[:game])
      redirect_to game_path(@game)
    else
      render 'edit'
    end
  end

  def destroy
    @game = current_user.games.find(params[:id])
    @game.destroy
    redirect_to games_path
  end
 
end
