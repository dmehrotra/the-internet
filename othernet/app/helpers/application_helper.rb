module ApplicationHelper
	def check_admin?
		if !current_neighbor.present?
			redirect_to "/login"
		end
	end
	
end
