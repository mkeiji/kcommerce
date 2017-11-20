class HomeController < ApplicationController
  
  # home page index action
  # @param 
  # @return void
  def index

    # get products to be displayed
    # @cars_to_be_displayed = Car.order("RAND()").limit(10)
    @cars_to_be_displayed = Car.order("id").page(params[:page]).per(4)

  end#end of index ACTION

end#--end of HomeController CLASS
