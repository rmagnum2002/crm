class Language < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru, as: [:default, :admin]

  has_many :employees
end
