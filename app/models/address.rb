class Address < ActiveRecord::Base
  attr_accessible :address_type, :bank_details, :city, :company_id, :country_id, :state_id, :fiscal_code, :postal_code, :street, :street_number

  belongs_to :company
  belongs_to :country
  belongs_to :state
end
