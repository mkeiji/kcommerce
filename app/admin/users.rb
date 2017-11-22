ActiveAdmin.register User do

  permit_params :email, :customer_id

  # recreating the form so we can add spinner and text editor
  form do |f|

    f.inputs "User" do

      f.input :customer_id, :as => :select, :collection => Customer.all
      f.input :email
      f.actions # create and cancel buttons

    end #loop end

  end #form loop end

end
