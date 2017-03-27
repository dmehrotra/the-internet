module Neighborhood
  class HomeController < ApplicationController
  	include ApplicationHelper
  	def index
    		@webthings = Webpage.all
    end
    def what
    end
    def where
    end
    def how
    end
    def when
    end
  end
end
