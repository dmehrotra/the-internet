class Thing < ActiveRecord::Base
	belongs_to :webpage
	mount_uploader :file, ThingUploader 
	def adjust_references
		File.open(self.file.path, "r+") do |f|	    
		    f.each do |line|
		        if line.include?("src")
		        	reference = find_referenced_file(line)
		        	if reference.present?
		        		 new_path = reference[:thing].file.url
		        		 f.print line.gsub(line.split('"')[reference[:index]], "http://localhost"+new_path)
		        		 
		        	end
		        end
		    end
		end
	end
	def find_referenced_file(line)
		src = nil
		line.split('"').each_with_index do |l,i|
			t = self.webpage.things.where(file:l)
			if t.present?
				src = {
					thing: t.first,
					index: i
				}
			end
		end
		return src
	end
end
