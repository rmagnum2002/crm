class SaleItem < ActiveRecord::Base
  attr_accessible :item_id, :price, :quantity, :sale_id, :total_price
  belongs_to :sale
  belongs_to :item

  before_save :update_total_price

  validates :price, :quantity, :item_id, presence: true

  def update_total_price
    self.total_price = self.quantity * self.price
  end
end
