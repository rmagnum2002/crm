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
    phone '+37300000000'
    association :site
    resp_user { create :user }
    association :company_branch
    association :client_type
    association :client_category
    association :company_source
  end

  factory :address do
    country_id 1
    state_id 1
    postal_code '2013'
    street 'Dacia'
    street_number '1000'
  end

  sequence :name do |n|
    "name-#{n}"
  end

  factory :company_source do
    name_ro { generate :name }
    name_ru { generate :name }
    name { generate :name }
  end

  factory :company_branch do
    name_ro { generate :name }
    name_ru { generate :name }
    name { generate :name }
  end

  factory :client_type do
    name_ro { generate :name }
    name_ru { generate :name }
    name { generate :name }
  end

  factory :client_category do
    name_ro { generate :name }
    name_ru { generate :name }
    name { generate :name }
  end
end
