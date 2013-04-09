class JobTitle < ActiveRecord::Base
  attr_accessible :job_title

  has_many :employee
end
