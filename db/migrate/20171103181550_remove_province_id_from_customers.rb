class RemoveProvinceIdFromCustomers < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :Province_id, :integer
  end
end
