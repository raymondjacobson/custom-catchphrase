module ApplicationHelper
	def full_title()
		if user_signed_in?
			"Catch Phrase | #{current_user.email}"
		else
			"Custom Catch Phrase"
		end
	end
end
