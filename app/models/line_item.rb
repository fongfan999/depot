class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
    price * quantity
  end

  def decrease_quantity!
    self.update(quantity: quantity - 1) if quantity > 0
    self.cart.line_items.delete(self) if quantity == 0
    true
  end
end
