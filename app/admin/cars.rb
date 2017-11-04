ActiveAdmin.register Car do

 permit_params :model, :make, :trim, :price, :stock_quantity, :image, :category_id

end
