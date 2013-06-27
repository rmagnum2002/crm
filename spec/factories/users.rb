# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email { generate(:email) }
    password 'pleasestandup'
    password_confirmation 'pleasestandup'
    role 'admin'
    approved true
  end
end
