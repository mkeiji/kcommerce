class HomeController < ApplicationController
  def index
    # get all products
    @all_cars = Car.all
  end
end
