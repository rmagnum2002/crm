class Address < ActiveRecord::Base
  attr_accessible :address_type, :bank_details, :city, :company_id,
                  :country_id, :state_id, :fiscal_code, :postal_code,
                  :street, :street_number

  validates :country_id, :state_id, :postal_code, :street, :street_number, :presence => true

  belongs_to :company, :inverse_of => :addresses
  belongs_to :country
  belongs_to :state
end
