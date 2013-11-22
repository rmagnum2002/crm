class JobTitle < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru

  belongs_to :site
  has_many :employees
end
