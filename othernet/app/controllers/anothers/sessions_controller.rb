class Anothers::SessionsController < Devise::SessionsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in).push(:another_name)
  end
end