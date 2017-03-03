require 'rails_helper'
RSpec.describe Webpage, type: :model do
 it {should belong_to :spud}
end
