require 'test_helper'

class CartTest < ActiveSupport::TestCase

  test "when providing unique products" do
    cart = Cart.create
    line_item = cart.add_product(products(:one).id)
    line_item.save

    line_item = cart.add_product(products(:ruby).id)
    line_item.save

    assert_equal cart.line_items.count, 2
  end

  test "when providing duplicate products" do
    cart = Cart.create
    line_item = cart.add_product(products(:one).id)
    line_item.save
    
    line_item = cart.add_product(products(:one).id)
    line_item.save

    assert_equal cart.line_items.count, 1
  end
end
