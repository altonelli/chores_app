require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe Unit do
    it { should have_many(:unit_users) }
  end


end
