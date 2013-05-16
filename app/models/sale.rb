class Sale < ActiveRecord::Base
  attr_accessible :saleable_id, :saleable_type, :user_id, :ammount
  belongs_to :saleable, polymorphic: true
  belongs_to :user

  def self.total_grouped_by_day(start)
    sales = Sale.where(created_at: start.beginning_of_day..Time.zone.now).group("date(created_at)").sum(:ammount)
  end
end
