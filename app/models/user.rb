class User < ActiveRecord::Base

  has_secure_password
  belongs_to :unit
  has_many :user_chores
  has_many :chores, through: :user_chores

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
