# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  to_create do |instance|
    unless instance.save
      raise "Invalid record: " + instance.errors.full_messages.join(", ")
    end
  end

  factory :employee do
    first_name "Alexandru"
    last_name "Lyashenko"
    gender_id 1
  end

end
