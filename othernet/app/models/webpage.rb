class Webpage < ActiveRecord::Base

  belongs_to :another,
  	inverse_of: :webpages
  belongs_to :type,
    inverse_of: :webpages
  validates_presence_of :another_id
  has_many :things,
		inverse_of: :webpage
  

  attr_accessor :thing



end
