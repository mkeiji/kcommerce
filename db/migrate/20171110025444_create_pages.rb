class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :is_published
      t.boolean :display_in_menu

      t.timestamps
    end
  end
end
