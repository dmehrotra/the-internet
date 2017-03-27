module Search
  class ControlController < ApplicationController
  	include ApplicationHelper
  	def index
    		@webthings = Webpage.all
    end
  end
end
