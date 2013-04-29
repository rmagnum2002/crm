class OrganizationalForm < ActiveRecord::Base
  attr_accessible :organizational_form

  has_many :companies

  UNRANSACKABLE_ATTRIBUTES = ["id"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
