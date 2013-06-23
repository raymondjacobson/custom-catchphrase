class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_owns_group
  	@group = current_user.groups.find_by_id(params[:group_id] || params[:id])

  	unless @group.present?
  		flash[:error] = "That's not your game"
  		redirect_to root_path
  	end
  end

end
