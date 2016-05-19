class User < ActiveRecord::Base
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }
  validates :password_digest, presence: true, length: { minimum: 6 }


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
