class Sale < ActiveRecord::Base
  attr_accessible :saleable_id, :saleable_type, :user_id, :ammount
  belongs_to :saleable, polymorphic: true
  belongs_to :user
end
