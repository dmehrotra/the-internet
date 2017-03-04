module Lodge
  class HomeController < ApplicationController
  	include ApplicationHelper
	  before_filter :check_admin?
    def index  
  		
  	end
  	
  end
end