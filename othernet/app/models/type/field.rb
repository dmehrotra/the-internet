class Type
	class Field
		attr_accessor :type, :attribute, :collection, :label_method, :resource, :selected
		def initialize(resource, field)
			@resource = resource
			public_send(field)

		end

		def image
			@type='file_field'
			@attribute = :image
		end
		def link
			@type = "text"
			@attribute = :link
		end
		def quote
			@type = "text"
			@attribute = :quote
		end
		def quote_author
			@type = "text"
			@attribute = :quote_author
		end
		def emoji
			@type = "select_box"
			@attribute = :emoji
			@collection = ['Lovely', 'Fun', 'Confident', 'Better', 'Hopeful']
			@label_method = nil
			@selected = resource.emoji.present? ? resource.emoji : nil
		end
		def psa_type
			@type = "radio_buttons"
			@collection = ['Educational/Awareness', 'Clinical Trial Recruitment', 'Disease Awareness Day']
			@attribute = :psa_type
		end
	end
end