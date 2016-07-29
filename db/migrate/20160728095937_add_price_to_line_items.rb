class AddPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :price, :decimal, precision: 11, scale: 2
  end
end
