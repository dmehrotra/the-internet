class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    before_action :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception
	before_filter :lodge_layout
	layout :lodge_layout
	def lodge_layout
		if lodge_mode
			'lodge'
		end
	end

	def lodge_mode
		self.class.parent == Lodge
	end

	def after_sign_in_path_for(resource)
		if resource.is_admin?
			lodge_path
		else
		 	root_path
		end
	end
	def configure_permitted_parameters
		 
		devise_parameter_sanitizer.for(:sign_up) do |u|
 		 u.permit(:another_name, :password, :password_confirmation)
		end

  	end

end
