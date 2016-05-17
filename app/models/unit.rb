class Unit < ActiveRecord::Base
  has_many :unit_users
  has_many :users, through: :unit_users
  has_many :chores, through: :users
end
