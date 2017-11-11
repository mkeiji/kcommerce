class ApplicationController < ActionController::Base

  # define get_page_nav function to be accessable
  before_action :get_page_nav

  protect_from_forgery with: :exception

  # get_page_nav creates an instance var to store the pages from the db
  # @return void
  def get_page_nav

    @page_nav = Page.where("display_in_menu = true && is_published = true").order(id: :asc)

  end #end get_page_nav FUNCTION

end #end of CONTROLLER
