class Company < ActiveRecord::Base
  attr_accessible :bank_req, :company_branch_id, :client_at, :client_category_id, :client_type_id, :client_status_id, :email, :facebook, :fax, :fisc_id, :name,
                  :phone, :responsible_id, :skype, :company_source_id, :user_id, :website, :number_employees, :organizational_form_id

  belongs_to :user
  belongs_to :company_branch
  belongs_to :company_source
  belongs_to :client_category
  belongs_to :client_type
  belongs_to :client_status
  belongs_to :organizational_form

  has_many :employee, :dependent => :destroy
end