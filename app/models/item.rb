class Item < ActiveRecord::Base
  attr_accessible :name, :name_ro, :name_ru

  has_many :sale_items
end
