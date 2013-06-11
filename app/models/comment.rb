class Comment < ActiveRecord::Base
  attr_accessible :content, :result_id, :result_date, :result_time, :events_attributes, :commentable_id, :commentable_type, :user_id
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates_presence_of :content

  has_many :events, :dependent => :destroy
  accepts_nested_attributes_for :events, allow_destroy: true
end
