module Search
  class ControlController < ApplicationController
  	include ApplicationHelper
	  
    def index  
    	
  		@query = Query.new

  	end
  	
  end
end