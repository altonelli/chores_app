class Unit < ActiveRecord::Base

  def slug
   name.downcase.gsub(" ", "-")
  end

 def to_param
   "#{id}-#{slug}"
 end

  has_many :unit_users
  has_many :users, through: :unit_users
  has_many :chores, through: :users
end
