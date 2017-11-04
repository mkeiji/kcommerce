class ChangeProvinceTaxesTypeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :provinces, :gst, :float
    change_column :provinces, :pst, :float
    change_column :provinces, :hst, :float
  end
end
