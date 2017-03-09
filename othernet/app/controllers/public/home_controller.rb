module Public
  class HomeController < ApplicationController
  	include ApplicationHelper
  	def index
  		@pages = @current_neighbor.webpages
    end
  end
end
