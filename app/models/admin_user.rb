class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # TODO validate email unique per site
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, request_keys: [:host]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :site

  # Devise authenticate user by site
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    host = conditions.delete(:host)
    joins(:site).where(conditions).where(sites: {host: host}).select('admin_users.*').first
  end
end
