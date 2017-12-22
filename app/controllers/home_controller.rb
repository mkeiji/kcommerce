class HomeController < ApplicationController

  # home page index action
  # @param
  # @return void
  def index
    
    # get products to be displayed
    # @cars_to_be_displayed = Car.order("RAND()").limit(10)
    # @cars_to_be_displayed = Car.order("id").page(params[:page]).per(4)

    # # cars to be displayed (using query function from model)
    # @cars_to_be_displayed = Car.search(params[:category], params[:search], params[:page])

    # check if search was requested
    if params[:search]

      # get parameters values
      category = params[:category]
      search_item = params[:search]

      # CTS - check the type of search / filter
      if category == 'category_id'

        @cars_to_be_displayed = Car.where(:category => search_item).order("id").page(params[:page]).per(4)

      else

        @cars_to_be_displayed = Car.where("lower(#{category}) LIKE ?", "%#{search_item.downcase}%").order("id").page(params[:page]).per(4)

      end#--end CTS

    # if there is no search request, display everything
    else

      @cars_to_be_displayed = Car.order("id").page(params[:page]).per(4)

    end

    # variables to be used in the search and filter queries
    @search_param = params[:search]
    @category_param = params[:category]

    # # testing dotenv file (needs to restart the server for every change)
    # @envTest = ENV['TEST']

  end#end of index ACTION

end#--end of HomeController CLASS
