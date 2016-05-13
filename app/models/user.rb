class User < ActiveRecord::Base
  belongs_to :unit
  has_many :user_chores
  has_many :chores, through: :user_chores
end
