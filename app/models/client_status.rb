class ClientStatus < ActiveRecord::Base
  attr_accessible :client_status

  has_many :companies
end
