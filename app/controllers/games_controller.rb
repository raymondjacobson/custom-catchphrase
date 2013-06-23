class GamesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_owns_game

  def index
    @games = current_user.games

  end

  def show

  end

  def new

  end

  def edit

  end

  def create
   
  end

  def update

  end

  def destroy
 
end
