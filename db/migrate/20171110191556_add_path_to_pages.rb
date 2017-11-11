class AddPathToPages < ActiveRecord::Migration[5.1]
  def change
    add_column :pages, :page_path, :string
  end
end
