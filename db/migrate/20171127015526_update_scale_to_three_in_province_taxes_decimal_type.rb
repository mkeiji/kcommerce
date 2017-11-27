class UpdateScaleToThreeInProvinceTaxesDecimalType < ActiveRecord::Migration[5.1]
  def change
    change_column :provinces, :gst, :decimal, :precision => 10, :scale => 3
    change_column :provinces, :pst, :decimal, :precision => 10, :scale => 3
    change_column :provinces, :hst, :decimal, :precision => 10, :scale => 3
  end
end
