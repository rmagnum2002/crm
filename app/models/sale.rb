class Sale < ActiveRecord::Base
  attr_accessible :saleable_id, :saleable_type, :user_id, :ammount, :sale_items_attributes,
                  :order_number, :sale_date, as: [:default, :admin]

  belongs_to :site
  belongs_to :saleable, polymorphic: true
  belongs_to :user
  has_many :sale_items, dependent: :destroy

  validates :order_number, presence: true

  accepts_nested_attributes_for :sale_items, allow_destroy: true

  def self.total_grouped_by_day(start)
    Sale.where(sale_date: start.beginning_of_day..Time.zone.now).group("date(sale_date)").sum(:ammount)
  end

  def update_ammount
    self.ammount = self.sale_items.sum(:total_price)
    self.save!
  end

  before_create :set_site_from_user

  def set_site_from_user
    self.site = user.site
  end
end
