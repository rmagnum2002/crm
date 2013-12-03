class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :recoverable email recovering not used
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, request_keys: [:host]

  # Custom validation with email uniq bind to site
  validates_presence_of   :email
  validates_uniqueness_of :email, :allow_blank => true, :if => :email_changed?, scope: :site_id
  validates_format_of     :email, :with  => /\A[^@]+@[^@]+\z/, :allow_blank => true, :if => :email_changed?

  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of       :password, :within => 6..32, :allow_blank => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :approved, as: [:default, :admin]
  attr_accessible :role, :as => :admin

  has_many :companies
  has_many :employee
  has_many :activities
  has_many :comments
  has_many :sales
  belongs_to :site

  # Role user is the default role when creating new user
  ROLES = %w[user moderator admin]

  def activated?
    if self.role == "user"
     return false
    else
      return true
    end
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  # Devise authenticate user by site
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    host = conditions.delete(:host)
    joins(:site).where(conditions).where(sites: {host: host}).select('users.*').first
  end
end
