class AddPageRefToBlocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :blocks, :page, foreign_key: true
  end
end
