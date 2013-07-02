# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  to_create do |instance|
    unless instance.save
      raise "Invalid record: " + instance.errors.full_messages.join(", ")
    end
  end

  factory :comment do
    content "New comment"
  end

end
