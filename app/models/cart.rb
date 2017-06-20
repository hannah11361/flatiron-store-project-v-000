class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.inject{ |sum, item| sum + item.total}
  end

  def add_item
  end
end
