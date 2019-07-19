class ApplicationController < ActionController::Base

  # CONFIG
  # ----------------------------------------------
  # define get_page_nav function to be accessable
  before_action :get_page_nav, :get_all_blocks

  protect_from_forgery with: :exception


  # FUNCTIONS
  # ----------------------------------------------

  # get_page_nav creates an instance var to store the pages from the db
  # @return void
  def get_page_nav

    @page_nav = Page.where(display_in_menu: 't').where(is_published: 't').order(id: :asc)

  end #end get_page_nav FUNCTION

  # creates an instance var to store the blocks from the db
  # @return void
  def get_all_blocks

    @all_blocks = Block.where(is_published: 't')

  end #end get_page_nav FUNCTION

end #end of CONTROLLER
