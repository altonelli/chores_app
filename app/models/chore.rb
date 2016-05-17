class Chore < ActiveRecord::Base

  def slug
   title.downcase.gsub(" ", "-")
  end

 def to_param
   "#{id}-#{slug}"
 end

  has_many :user_chores, dependent: :destroy
  has_many :users, through: :user_chores
end
