module Lodge
  class HomeController < ApplicationController
  	include ApplicationHelper
	  before_filter :check_admin?
    def index  
    	
  		@pages = current_neighbor.webpages

  	end
  	
  end
end