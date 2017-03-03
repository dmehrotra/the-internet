class Webpage < ActiveRecord::Base

  belongs_to :spud,
  	inverse_of: :webpages

  validates_presence_of :spud_id

  
end
