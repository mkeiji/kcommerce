ActiveAdmin.register Page do

  permit_params :title, :body, :is_published, :display_in_menu, :page_path, :section_id

  # recreating index of the table displayed (hide the body column)
  index do
    column :id, :sortable => :id
    column :title, :sortable => :title
    column :is_published
    column :section_id
    column :page_path
    column :created_at, :sortable => :created_at
    actions
  end

  # recreating the form so we can add spinner and text editor
  form do |f|

      f.inputs "Page" do

        f.input :title
        f.input :section_id, :as => :select, :collection => Section.all
        f.input :page_path
        f.input :body, as: :html_editor, :label => "Body"
        f.input :is_published
        f.input :display_in_menu
        f.actions # create and cancel buttons

      end #loop end

    end #form loop end

end #end of the MODEL
