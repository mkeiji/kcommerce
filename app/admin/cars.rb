ActiveAdmin.register Car do

 permit_params :model, :make, :trim, :price, :stock_quantity, :image, :category_id

 # recreating the form so we can change the image to be a uploader button
 form(:html => { :multipart => true }) do |f|

    f.inputs "Car" do

      f.input :model
      f.input :make
      f.input :trim
      f.input :price
      f.input :stock_quantity
      f.input :image, :as => :file # make the input as a button to upload a file
      f.actions # create and cancel buttons

    end #loop end

  end #form loop end

end #--end of activeadmin Car model
