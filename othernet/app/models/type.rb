class Type < ActiveRecord::Base
	has_many :webpages,
	  inverse_of: :type
	def self.build_fields(post)
		form = []
		chosen_type = type_field_map.select {|type_match| type_match[:name].downcase == post.type.name.downcase}.first
		binding.pry
		chosen_type[:fields].each{|field| form << Field.new(post,field)}
		form
	end


	private
	def self.type_field_map
		[
			{
				name: "Thing",
				fields:["type_of_post","job","publish_date","publish_now",'featured', 'user', 'image', 'quote','quote_author', 'categories', 'response', 'series', 'emoji'] 

			}
		]
	end
end
