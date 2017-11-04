class AddCarRefToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :line_items, :car, foreign_key: true
  end
end
