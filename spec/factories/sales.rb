# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  to_create do |instance|
    unless instance.save
      raise "Invalid record: " + instance.errors.full_messages.join(", ")
    end
  end

  sequence :order_number do |n|
    "N-#{n}"
  end

  sequence :number do |n|
    n
  end

  factory :sale do
    order_number { generate (:order_number) }
    association :site
    association :user
  end

  factory :site do
    name 'test site'
    host { "test#{generate :number}.crm.tld" }
  end
end
