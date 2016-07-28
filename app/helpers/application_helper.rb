module ApplicationHelper
  include CurrentCart
  def current_cart
    set_cart
    @cart
  end
end
