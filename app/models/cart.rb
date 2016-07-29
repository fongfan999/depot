class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_product(product_id)
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product_id,
        price: Product.find(product_id).price)
    end

    current_item
  end

  def total_price
    line_items.inject(0) { |sum, item| sum += item.total_price }
  end
end
