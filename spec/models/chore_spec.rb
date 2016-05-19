require 'rails_helper'

RSpec.describe Chore, type: :model do
  describe Chore do
      it { should have_many(:user_chores) }
    end

end
