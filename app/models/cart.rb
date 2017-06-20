class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    sum = 0
    line_items.each { |l_item| sum += l_item.total}
    sum
  end

  def add_item(id)
    line_item = self.line_items.find_by(item_id: id)
    if line_item.nil?
      line_item = line_items.build(item_id: id, cart: self)
    else
      line_item.quantity += 1
    end
    line_item
  end

  def checkout
    self.update(status: "submitted")
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end

    user.remove_cart

  end
end
