class Chore < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  has_many :user_chores, dependent: :destroy
  has_many :users, through: :user_chores
end
