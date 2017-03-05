class Thing < ActiveRecord::Base
	belongs_to :webpage
	mount_uploader :file, ThingUploader 
end
