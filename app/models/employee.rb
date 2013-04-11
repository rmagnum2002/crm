class Employee < ActiveRecord::Base
  attr_accessible :birthday, :client_date, :company_id, :completion, :decision, :email, :facebook, :first_name, :gender, :job_title_id, :language, :last_name, :mobile, :patronymic, :phone, :simtravel, :skype, :user_id

  belongs_to :company
  belongs_to :user
  belongs_to :job_title

  LANGUAGE = { 0 => "russian", 1 => "romanian", 2 => "english" }

  GENDER = { 0 => "male", 1 => "female" }

  def full_name
    "#{first_name} #{last_name} #{patronymic}".strip
  end
end
