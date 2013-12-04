FactoryGirl.define do

  factory :employee do
    first_name 'Alexandru'
    last_name 'Lyashenko'
    gender_id 1
    association :company
    association :user
  end
end
