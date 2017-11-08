class HomeController < ApplicationController
  def index
    # get first customer
    @first_customer = Customer.first
  end
end
