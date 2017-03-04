module ApplicationHelper
	def check_admin?
		if !current_another.present?
			redirect_to "/login"
		end
	end
	
end
