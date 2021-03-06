class Company < ActiveRecord::Base
  has_paper_trail :on => [:update]

  attr_accessible :bank_req, :company_branch_id, :client_at, :client_category_id, :client_type_id, :client_status_id, :marked_to_remove,
                  :email, :facebook, :fax, :fisc_id, :name, :phone, :responsible_id, :skype, :company_source_id,
                  :user_id, :website, :number_employees, :organizational_form_id, :addresses_attributes

  validates :name, :company_branch_id, :client_category_id, :client_type_id, :client_status_id,
            :company_source_id, :phone, presence: true

  belongs_to :user
  belongs_to :company_branch
  belongs_to :company_source
  belongs_to :client_category
  belongs_to :client_type
  belongs_to :client_status
  belongs_to :organizational_form
  has_many :addresses, :dependent => :destroy, :inverse_of => :company
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :sales, as: :saleable

  accepts_nested_attributes_for :addresses, :allow_destroy => true

  has_many :employee, :dependent => :destroy

  UNRANSACKABLE_ATTRIBUTES = ["id", "user_id", "responsible_id", "company_branch_id", "company_source_id", "client_category_id",
                              "client_type_id", "client_at", "client_status_id", "organizational_form_id", "created_at"]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def self.text_search(query)
    if query.present?
      where("name LIKE :q
            or email LIKE :q
            or skype LIKE :q
            or bank_req LIKE :q
            or phone LIKE :q
            or website LIKE :q", q: "%#{query}%")
    end
  end

  def to_delete?
    if self.marked_to_remove == true
      return true
    end
  end
end
