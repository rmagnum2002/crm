class Country < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru

  has_many :states
  has_many :addresses
end
