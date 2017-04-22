class Type < ActiveRecord::Base
	has_many :webpages,
	  inverse_of: :type
	def self.build_fields(post)
		form = []
		chosen_type = type_field_map.select {|type_match| type_match[:name].downcase == post.type.name.downcase}.first
		chosen_type[:fields].each{|field| form << Field.new(post,field)}
		form
	end


	private
	def self.type_field_map
		[
			{
				name: "Thing",
				fields:['neighbor_id','type_id','name','description','url','thing'] 

			},
				name: "otherweb page",
				fields:["bg_img","otherpic","title", "headline", "section_one_title", "section_one_content", "section_two_title", "section_two_content", "section_three_title", "section_three_content", "text_under_image",'neighbor_id','type_id','name','description','url',] 

		]
	end
end
