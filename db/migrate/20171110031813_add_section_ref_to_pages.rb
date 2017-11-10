class AddSectionRefToPages < ActiveRecord::Migration[5.1]
  def change
    add_reference :pages, :section, foreign_key: true
  end
end
