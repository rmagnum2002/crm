class State < ActiveRecord::Base
  attr_accessible :country_id, :name, :name_ro, :name_ru

  belongs_to :country
  has_many :addresses
end
