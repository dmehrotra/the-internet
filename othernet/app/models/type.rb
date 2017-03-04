class Type < ActiveRecord::Base
	has_many :webpages,
	  inverse_of: :type

end
