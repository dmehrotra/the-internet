class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
	before_filter :backyard_layout
	layout :backyard_layout
	def backyard_layout
		if backyard_mode
			'backyard'
		elsif search_mode
			'search'
		end
		
	end
	def search_mode
		self.class.parent == Search
	end
	def backyard_mode
		self.class.parent == Backyard
	end

	def after_sign_in_path_for(resource)
		if resource.is_admin?
			backyard_path
		else
		 	root_path
		end
	end
	private
	def configure_permitted_parameters
	 	added_attrs = [:another_name, :email, :password, :password_confirmation, :remember_me]
	    devise_parameter_sanitizer.for(:sign_up) << added_attrs
	    devise_parameter_sanitizer.for(:account_update) << added_attrs
        devise_parameter_sanitizer.for(:sign_in) << added_attrs

  	end

end
