class AddScaleToCarsPriceColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :cars, :price, :decimal, :precision => 10, :scale => 2
  end
end
