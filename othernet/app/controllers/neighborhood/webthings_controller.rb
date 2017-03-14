module Neighborhood
  class WebthingsController < ApplicationController
  	include ApplicationHelper
    def show
      file = Webpage.find(params[:id]).things.first.file.path
      extension = @current_neighbor.webpages.find(params[:id]).things.first.file.file.extension

      disposition = 'attachment'
      mime = MIME::Types.type_for(file).first.content_type
      if %w{jpg png jpg gif bmp mov}.include?(extension) or extension == "pdf"
        disposition = 'inline'
      end
      send_file(file, :filename => file, :disposition => 'inline', :type => mime)

    end

  end
end