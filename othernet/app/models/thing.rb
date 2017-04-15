class Thing < ActiveRecord::Base
	belongs_to :webpage
	mount_uploader :file, ThingUploader 
	def adjust_references
		lines = IO.readlines(self.file.path).map do |line|
		   new_line = line
		   if new_line.include?("src") || new_line.include?("url")
		      
		      reference = find_referenced_file(new_line)
		      if reference.present?
		        
		        new_path = reference[:thing].file.url
		       	new_line = new_line.gsub(new_line.split('"')[reference[:index]], "http://10.0.0.2"+new_path)
		      end
		   end
		   new_line
		end
		File.open(self.file.path, 'w') do |file|
		  file.puts lines
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
