class ClientType < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru

  belongs_to :site
  has_many :companies

  UNRANSACKABLE_ATTRIBUTES = ["id", "created_at", "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
