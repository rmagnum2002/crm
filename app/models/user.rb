class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  attr_accessible :role, :as => :admin

  has_many :companies
  has_many :employee
  has_many :activities
  has_many :comments
  has_many :sales

  # Role user is the default role when creating new user
  ROLES = %w[user moderator admin]

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
