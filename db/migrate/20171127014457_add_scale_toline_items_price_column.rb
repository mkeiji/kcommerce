class AddScaleTolineItemsPriceColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :line_items, :price, :decimal, :precision => 10, :scale => 2
  end
end
