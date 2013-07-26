class Employee < ActiveRecord::Base
  has_paper_trail :on => [:update]

  attr_accessible :birthday, :client_date, :company_id, :completion, :decision, :email, :facebook, :first_name, :gender_id, :job_title_id,
                  :language_id, :last_name, :mobile, :patronymic, :phone, :simtravel, :skype, :user_id, :title, :marked_to_remove

  belongs_to :company
  belongs_to :user
  belongs_to :job_title
  has_many :comments, as: :commentable
  has_many :events
  belongs_to :gender
  belongs_to :language

  validates :first_name, :gender_id, presence: true

  TITLE = { 0 => :"employee.title.mrs",
            1 => :"employee.title.mr",
            2 => :"employee.title.miss" }

  def full_name
    "#{last_name} #{first_name} #{patronymic}".strip
  end

  UNRANSACKABLE_ATTRIBUTES = ["id", "user_id", "language", "gender", "company_id", "job_title_id", "decision", "title", "created_at",
                              "updated_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def self.text_search(query)
    if query.present?
      where("first_name LIKE :q
        or last_name LIKE :q
        or patronymic LIKE :q
        or email LIKE :q
        or simtravel LIKE :q
        or mobile LIKE :q", q: "%#{query}%")
    end
  end

  def to_delete?
    if self.marked_to_remove == true
      return true
    end
  end
end
