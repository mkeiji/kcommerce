ActiveAdmin.register Province do

  # allowing active admin to edit name
  permit_params :name, :pst, :gst, :hst

end
