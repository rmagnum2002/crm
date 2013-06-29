# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :company_name do |n|
    "company-name#{n}"
  end

  factory :company do
    name { generate (:company_name) } 
    company_branch_id 1
    client_category_id 1
    client_type_id 1
    client_status_id 1
    company_source_id 1
    phone "+37300000000"
  end

  factory :address do
    country_id 1
    state_id 1
    postal_code "2013"
    street "Dacia"
    street_number "1000"
  end
end
