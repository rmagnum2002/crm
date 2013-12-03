class CompanyBranch < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru, as: [:default, :admin]

  has_many :companies
  belongs_to :site

  UNRANSACKABLE_ATTRIBUTES = ["id", "created_at", "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
