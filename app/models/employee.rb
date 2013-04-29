class Employee < ActiveRecord::Base
  attr_accessible :birthday, :client_date, :company_id, :completion, :decision, :email, :facebook, :first_name, :gender, :job_title_id,
                  :language, :last_name, :mobile, :patronymic, :phone, :simtravel, :skype, :user_id, :title

  belongs_to :company
  belongs_to :user
  belongs_to :job_title
  has_many :comments, as: :commentable
  belongs_to :event

  LANGUAGE = { 0 => :"employee.language.romanian",
               1 => :"employee.language.russian",
               2 => :"employee.language.english"
              }

  GENDER = { 0 => :"employee.gender.male",
             1 => :"employee.gender.female"
            }

  TITLE = { 0 => :"employee.title.mrs",
            1 => :"employee.title.mr",
            2 => :"employee.title.miss" }

  def full_name
    "#{first_name} #{last_name} #{patronymic}".strip
  end

  UNRANSACKABLE_ATTRIBUTES = ["id", "user_id", "language", "gender", "company_id", "job_title_id", "decision", "title", "created_at",
                              "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end
end
