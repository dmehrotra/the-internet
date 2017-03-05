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
				fields:['another_id','type_id','name','url','thing'] 

			}
		]
	end
end
