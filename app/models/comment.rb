class Comment < ActiveRecord::Base
  attr_accessible :content, :result_id, :result_date, :result_time, :events_attributes
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_many :events
  accepts_nested_attributes_for :events, allow_destroy: true

  TYPE = { "Call" => 0, "Email" => 1, "Meeting" => 2}
end
