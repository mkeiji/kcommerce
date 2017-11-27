class AddScaleToProvinceTaxesDecimalType < ActiveRecord::Migration[5.1]
  def change
    change_column :provinces, :gst, :decimal, :precision => 10, :scale => 2
    change_column :provinces, :pst, :decimal, :precision => 10, :scale => 2
    change_column :provinces, :hst, :decimal, :precision => 10, :scale => 2
  end
end
