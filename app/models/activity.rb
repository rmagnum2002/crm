class Activity < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  belongs_to :trackable, polymorphic: true
  attr_accessible :action, :trackable, :user_id, :trackable_id, :trackable_type, as: [:default, :admin]
  before_create :set_site_from_user

  def set_site_from_user
    self.site = user.site
  end
end
