class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.string :title
      t.text :body
      t.string :position
      t.boolean :show_title
      t.boolean :is_published
      t.string :bootstrap_class

      t.timestamps
    end
  end
end
