
require 'rails_helper'
describe Neighbor do
   it { should have_and_belong_to_many :roles } 
   
end