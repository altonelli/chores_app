class Unit < ActiveRecord::Base
  has_many :users
  has_many :chores, through: :users
end
