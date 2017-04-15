module Neighborhood
  class WebthingsController < ApplicationController
  	include ApplicationHelper

    def results
    	
    	query = params[:search_query][:query]

    	pages = Search::Query.find(query)
    	@results = {
    		pages: pages,
    		query: query
    	}

    	render template:"neighborhood/webthings/show", :resource=> @pages
    end
 
    
    private
   	def query_params
      params.require(:search_query).permit(:query)
    end
  end
end