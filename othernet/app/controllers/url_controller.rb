
class UrlController < ApplicationController
	include ApplicationHelper
	def handle
		requested_page = othernet(request.server_name)
		if requested_page.present?
			if requested_page.get_html_file_if_exists.present?
				path = requested_page.get_html_file_if_exists.file.file.path
				send_file(path, :filename => path, :disposition => 'inline', :type => "text/html")
			end
		else
			
		end
		
	end
	def othernet(req_serv)
		 pages = Webpage.where(url:req_serv)
		 pages.present? ? pages.first : nil
	end
end
		# 	if pages.present?
				
		# 		file = pages.first.things[1].file.path
		#   		extension = pages.first.things[1].file.file.extension

		#   		disposition = 'attachment'
		#   		mime = MIME::Types.type_for(file).first.content_type
		#       	if %w{jpg png jpg gif bmp mov}.include?(extension) or extension == "pdf"
		#        		disposition = 'inline'
		#       	end
		#     	send_file(file, :filename => file, :disposition => 'inline', :type => mime)
		# 	else
		# 		# redirect_to neighborhood_home_index_path
		# 		redirect_to "http://other.net"
		# 	end
		# else
		# 	redirect_to search_control_index_path, :alert => 'This site does not exist on the othernet, consider building it by signing up.'
		# end