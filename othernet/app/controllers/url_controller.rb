
class UrlController < ApplicationController
	include ApplicationHelper
	def handle
		print request.server_name
		pages = Webpage.where(url:request.server_name)
		if request.server_name != "other.net"
			if pages.present?
				file = pages.first.things.first.file.path
		  		extension = pages.first.things.first.file.file.extension

		  		disposition = 'attachment'
		  		mime = MIME::Types.type_for(file).first.content_type
		      	if %w{jpg png jpg gif bmp mov}.include?(extension) or extension == "pdf"
		       		disposition = 'inline'
		      	end
		    	send_file(file, :filename => file, :disposition => 'inline', :type => mime)
			else
				# redirect_to neighborhood_home_index_path
				redirect_to "http://other.net"
			end
		else
			redirect_to search_control_index_path, :alert => 'This site does not exist on the othernet, consider building it by signing up.'
		end
	end
end
