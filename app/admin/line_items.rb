ActiveAdmin.register LineItem do

permit_params :quantity, :price, :order_id, :car_id 

end
