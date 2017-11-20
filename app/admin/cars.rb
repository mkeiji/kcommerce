ActiveAdmin.register Car do

 permit_params :model, :make, :trim, :price, :stock_quantity, :image, :year, :description, :category_id

  # recreating index of the table displayed (hide the body column)
  index do

    column :id, :sortable => :id
    column :model, :sortable => :model
    column :make, :sortable => :make
    column :trim, :sortable => :trim
    column :year, :sortable => :year
    column :price, :sortable => :price
    column :image, :sortable => :image
    column :created_at, :sortable => :created_at
    column :updated_at, :sortable => :updated_at
    actions

  end

 # recreating the form so we can change the image to be a uploader button
 form(:html => { :multipart => true }) do |f|

    f.inputs "Car" do

      f.input :model
      f.input :make
      f.input :trim
      f.input :year
      f.input :price
      f.input :stock_quantity
      f.input :description, as: :html_editor, :label => "Description"
      f.input :image, :as => :file # make the input as a button to upload a file
      f.actions # create and cancel buttons

    end #loop end

  end #form loop end

end #--end of activeadmin Car model
