class Employee < ActiveRecord::Base
  attr_accessible :birthday, :client_date, :company_id, :completion, :decision, :email, :facebook, :first_name, :gender, :job_title_id,
                  :language, :last_name, :mobile, :patronymic, :phone, :simtravel, :skype, :user_id, :title

  belongs_to :company
  belongs_to :user
  belongs_to :job_title
  has_many :comments, as: :commentable
  belongs_to :event

  LANGUAGE = { 0 => "Romanian", 1 => "Russian", 2 => "English" }

  GENDER = { 0 => "Male", 1 => "Female" }

  TITLE = {0 => "Doamna", 1 => "Domnul", 2 => "Domnisoara"}

  def full_name
    "#{first_name} #{last_name} #{patronymic}".strip
  end
end
