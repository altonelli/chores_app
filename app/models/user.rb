class User < ActiveRecord::Base

  def slug
   name.downcase.gsub(" ", "-")
  end

  def to_param
   "#{id}-#{slug}"
  end

  has_secure_password
  has_many :unit_users
  has_many :units, through: :unit_users
  has_many :user_chores, dependent: :destroy
  has_many :chores, through: :user_chores

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
