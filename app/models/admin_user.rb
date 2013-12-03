class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, request_keys: [:host]

  # Custom validation with email uniq bind to site
  validates_presence_of   :email
  validates_uniqueness_of :email, :allow_blank => true, :if => :email_changed?, scope: :site_id
  validates_format_of     :email, :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true, :if => :email_changed?

  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of       :password, :within => 6..32, :allow_blank => true

  attr_accessible :email, :password, :password_confirmation, :remember_me, as: [:default, :admin]
  belongs_to :site

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  # Devise authenticate user by site
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    host = conditions.delete(:host)
    joins(:site).where(conditions).where(sites: {host: host}).select('admin_users.*').first
  end
end
