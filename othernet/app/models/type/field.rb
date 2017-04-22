class Type
	class Field
		attr_accessor :type,:image,:label, :attribute,:wysiwyg, :collection, :label_method, :resource, :selected,:input_name
		def initialize(resource, field)
			@resource = resource
			public_send(field)

		end
		def description
			@type = 'text'
			@attribute = :description
			@wysiwyg = false;
		end
		def neighbor_id
			@type = 'hidden'
			@attribute = :neighbor_id
			@wysiwyg = false;
		
		end
		def type_id
			@type = 'hidden'
			@attribute = :type_id
			@wysiwyg = false;
		end
		def name
			@type = "text"
			@attribute = :name
			@wysiwyg = false;
		end
		def url
			@type = "text"
			@attribute = :url
			@wysiwyg = false;
		end
		def thing
			@type='file_field'
			@attribute = :thing
			@input_name = "things[file][]" 
			@wysiwyg = false;
		end
		def bg_img
			@type='file_field'
			@attribute = :bg_img 
			@input_name = "webpage[bg_img]" 
			@label= "Background Image"

		end
		def otherpic
			@type='file_field'
			@attribute = :otherpic 
			@input_name = "webpage[otherpic]" 
			@label= "Main Image"
		end

		def title
			@type='text'
			@attribute = :title 
			@description = ""
			@wysiwyg = true;
		end
		def headline
			@type='text'
			@attribute = :headline 
			@description = ""
			@wysiwyg = true;
		end
		def section_one_title
			@type='text'
			@attribute = :section_one_title 
			@description = ""
			@wysiwyg = true;
		end
		def section_one_content
			@type='text'
			@attribute = :section_one_content 
			@description = ""
			@wysiwyg = true;
		end
		def section_two_title
			@type='text'
			@attribute = :section_two_title 
			@description = ""
			@wysiwyg = true;
		end
		def section_two_content
			@type='text'
			@attribute = :section_two_content 
			@description = ""
			@wysiwyg = true;
		end
		def section_three_title
			@type='text'
			@attribute = :section_three_title 
			@description = ""
			@wysiwyg = true;
		end
		def section_three_content
			@type='text'
			@attribute = :section_three_content 
			@description = ""
			@wysiwyg = true;
		end
		def text_under_image
			@type='text'
			@attribute = :text_under_image 
			@description = ""
			@wysiwyg = true;
		end

		# def link
		# 	@type = "text"
		# 	@attribute = :link
		# end
		# def quote
		# 	@type = "text"
		# 	@attribute = :quote
		# end
		# def quote_author
		# 	@type = "text"
		# 	@attribute = :quote_author
		# end
		# def emoji
		# 	@type = "select_box"
		# 	@attribute = :emoji
		# 	@collection = ['Lovely''Fun''Confident', 'Better', 'Hopeful']
		# 	@label_method = nil
		# 	@selected = resource.emoji.present? ? resource.emoji : nil
		# end
		# def psa_type
		# 	@type = "radio_buttons"
		# 	@collection = ['Educational/Awareness', 'Clinical Trial Recruitment', 'Disease Awareness Day']
		# 	@attribute = :psa_type
		# end
	end
end