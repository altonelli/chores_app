class User < ActiveRecord::Base

  has_secure_password
  belongs_to :unit
  has_many :user_chores
  has_many :chores, through: :user_chores
end
