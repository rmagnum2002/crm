class Site < ActiveRecord::Base
  attr_accessible :host, :name, :description, as: :admin

  has_many :users
  has_many :admin_users

  has_many :activities
  has_many :company_branches
  has_many :company_sources
  has_many :client_categories
  has_many :client_types
  has_many :client_statuses
  has_many :organizational_forms
  has_many :job_titles
  has_many :companies
  has_many :countries
  has_many :events
  has_many :items
  has_many :sales
  has_many :comments

  validates_presence_of :host, :name
  validates_uniqueness_of :host
end
