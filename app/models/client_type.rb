class ClientType < ActiveRecord::Base
  attr_accessible :client_type

  has_many :companies
end
