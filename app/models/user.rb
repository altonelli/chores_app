class User < ActiveRecord::Base

  has_secure_password
  belongs_to :unit_user
  has_many :user_chores, dependent: :destroy
  has_many :chores, through: :user_chores

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
