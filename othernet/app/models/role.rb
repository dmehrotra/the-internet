class Role < ActiveRecord::Base
  VALID_NAMES = ['Super']
  has_and_belongs_to_many :anothers, -> { uniq }
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_inclusion_of :name, in: VALID_NAMES
end
