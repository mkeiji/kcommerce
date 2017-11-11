class PagesController < ApplicationController
  def show

    # # get page id
    # @current_page_id = params[:id].to_i
    #
    # # get page obj
    # @current_page_object = Page.find(@current_page_id)

    # get page path (from db)
    @page_path = params[:page_path].to_s

    # find object (based on the page_path)
    @current_page_object = Page.find_by page_path: @page_path

  end
end
