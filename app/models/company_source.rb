class CompanySource < ActiveRecord::Base
  attr_accessible :name

  has_many :companies
end
