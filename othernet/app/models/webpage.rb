class Webpage < ActiveRecord::Base
	require 'uri'
  before_save :downcase_fields

  belongs_to :neighbor,
  	inverse_of: :webpages
  belongs_to :type,
    inverse_of: :webpages
  validates_presence_of :neighbor_id, :name, :url
  has_many :things,
		inverse_of: :webpage,
		dependent: :destroy
  
 validates_uniqueness_of :url


  attr_accessor :thing


def downcase_fields
  self.url.downcase!
end

end
