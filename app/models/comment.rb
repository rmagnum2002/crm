class Comment < ActiveRecord::Base
  attr_accessible :content, :result_id, :result_date, :result_time, :events_attributes,
                  :commentable_id, :commentable_type, :user_id, as: [:default, :admin]
  belongs_to :commentable, polymorphic: true
  belongs_to :site
  belongs_to :user

  validates_presence_of :content

  has_many :events, :dependent => :destroy
  accepts_nested_attributes_for :events, allow_destroy: true

  before_create :set_site_from_user

  def set_site_from_user
    self.site = user.site
  end
end
