class Activity < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  attr_accessible :action, :trackable, :user_id, :trackable_id, :trackable_type
end
