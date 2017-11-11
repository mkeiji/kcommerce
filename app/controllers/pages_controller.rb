class PagesController < ApplicationController
  def show

    # get page id
    @current_page_id = params[:id].to_i

    # get page obj
    @current_page_object = Page.find(@current_page_id)

  end
end
