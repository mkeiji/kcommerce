class ChangeProvinceTaxesTypeToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :provinces, :gst, :decimal
    change_column :provinces, :pst, :decimal
    change_column :provinces, :hst, :decimal
  end
end
