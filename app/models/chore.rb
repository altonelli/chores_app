class Chore < ActiveRecord::Base
  has_many :user_chores, dependent: :destroy
  has_many :users, through: :user_chores
end
