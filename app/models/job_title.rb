class JobTitle < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru

  has_many :employees
end
