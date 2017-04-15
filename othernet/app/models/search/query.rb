module Search
	class Query 
		extend ActiveModel::Naming
			include ActiveModel::Conversion
			
			def query
			end
			def self.find(q)
				Webpage.where("description LIKE '%#{q}%'")
			end
	end
end

