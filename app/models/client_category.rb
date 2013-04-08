class ClientCategory < ActiveRecord::Base
  attr_accessible :category

  has_many :companies
end
