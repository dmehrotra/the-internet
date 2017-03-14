module Neighborhood
  class HomeController < ApplicationController
  	include ApplicationHelper
  	def index
    	@webthings = Webpage.all
    	
    end
  end
end
