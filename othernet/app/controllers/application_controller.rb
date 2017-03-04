class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
	    added_attrs = [:another_name]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  	end

end
