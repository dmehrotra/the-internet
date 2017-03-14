class Webpage < ActiveRecord::Base

  belongs_to :neighbor,
  	inverse_of: :webpages
  belongs_to :type,
    inverse_of: :webpages
  validates_presence_of :neighbor_id, :name, :url
  has_many :things,
		inverse_of: :webpage,
		dependent: :destroy
  

  attr_accessor :thing



end
