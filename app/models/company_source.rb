class CompanySource < ActiveRecord::Base
  attr_accessible :source

  has_many :companies
end
