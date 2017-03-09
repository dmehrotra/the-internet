class Type
	class Field
		attr_accessor :type, :attribute, :collection, :label_method, :resource, :selected
		def initialize(resource, field)
			@resource = resource
			public_send(field)

		end
		def neighbor_id
			@type = 'hidden'
			@attribute = :neighbor_id
		
		end
		def type_id
			@type = 'hidden'
			@attribute = :type_id
		end
		def name
			@type = "text"
			@attribute = :name
		end
		def url
			@type = "text"
			@attribute = :url
		end
		def thing
			@type='file_field'
			@attribute = :thing
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
		# 	@collection = ['Lovely', 'Fun', 'Confident', 'Better', 'Hopeful']
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