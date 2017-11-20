class HomeController < ApplicationController
  
  # home page index action
  # @param 
  # @return void
  def index

    # get products to be displayed
    @all_cars = Car.all
    @cars_to_be_displayed = Car.order("RAND()").limit(10)

  end#end of index ACTION

end#--end of HomeController CLASS
