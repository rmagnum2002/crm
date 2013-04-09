class Address < ActiveRecord::Base
  attr_accessible :address_type, :bank_details, :city, :company_id, :country, :fiscal_code, :postal_code, :street, :street_number

  belongs_to :company
end
