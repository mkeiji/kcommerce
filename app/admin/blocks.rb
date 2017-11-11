ActiveAdmin.register Block do

  permit_params :title, :body, :position, :show_title, :is_published, :bootstrap_class, :order, :page_id

  # recreating index of the table displayed (hide the body column)
  index do
    column :id, :sortable => :id
    column :title, :sortable => :title
    column :position
    column :order
    column :show_title
    column :is_published
    column :page_id
    actions
  end

  # recreating the form so we can add spinner and text editor
  form do |f|

      f.inputs "Block" do

        f.input :title
        f.input :page_id, :as => :select, :collection => Page.all
        f.input :body, as: :html_editor, :label => "Body"
        f.input :position, :as => :select, :collection => [ [ "Header", "header"], ["Block", "block"] ]
        f.input :order
        f.input :show_title
        f.input :is_published
        f.input :bootstrap_class
        f.actions # create and cancel buttons

      end #loop end

    end #form loop end

end #end of MODEL
