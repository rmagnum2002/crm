class OrganizationalForm < ActiveRecord::Base
  attr_accessible :organizational_form

  has_many :companies
end
