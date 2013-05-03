class JobTitle < ActiveRecord::Base
  attr_accessible :job_title, :job_title_ro, :job_title_ru

  has_many :employee
end
