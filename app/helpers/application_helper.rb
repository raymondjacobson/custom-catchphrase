module ApplicationHelper
	def full_title(current_title)
		base_title = "Custom Catch-Phrase"
		if user_signed_in?
			"#{base_title} | #{current_user.email}"
		elsif !current_title.empty?
			"#{base_title} | #{current_title}"
		else
			"#{base_title}"
		end
	end
end
