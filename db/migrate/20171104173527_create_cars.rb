class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.string :trim
      t.decimal :price
      t.integer :stock_quantity
      t.string :image

      t.timestamps
    end
  end
end
