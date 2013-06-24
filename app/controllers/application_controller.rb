class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_owns_game
  	@game = current_user.games.find_by_id(params[:game_id] || params[:id])
  	
  	unless @game.present?
  		redirect_to root_path
  	end
  end

end
