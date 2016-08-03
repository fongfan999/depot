class AddOrderToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :order, index: true, foreign_key: true
  end
end
