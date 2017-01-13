require 'rails_helper'

RSpec.describe UserChore, type: :model do

  describe UserChore do
    it { should belong_to(:user) }
  end

  describe UserChore do
    it { should belong_to(:chore) }
  end
end
