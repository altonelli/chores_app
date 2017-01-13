require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it { should have_many(:unit_users) }
  end
  describe User do
    it { should have_many(:user_chores) }
  end
  

end
