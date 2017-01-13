require 'rails_helper'

RSpec.describe UnitUser, type: :model do
  describe UnitUser do
    it { should belong_to(:user) }
  end
  describe UnitUser do
    it { should belong_to(:unit) }
  end
  
end
