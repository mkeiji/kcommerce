class PagesController < ApplicationController

  # Control pages information feed with data from db
  #
  def show

    # for company pages
    # ------------------------------------
    if params[:page_path]
      # For company related pages
      # get page path (from db)
      @page_path = params[:page_path].to_s

      # find object (based on the page_path)
      @current_page_object = Page.find_by page_path: @page_path
    end#--end company pages

    # for DETAILS page
    # ------------------------------------
    # check if there is a params id (for details page)
    if params[:id]
      # For car related pages
      @car_id = params[:id].to_s

      # find car (based on car id)
      @current_car_object = Car.find(@car_id)

    end#--end of details page check

    # for CART page
    # ------------------------------------
    # CE - check if there were a cart enquire
    if params[:cart]

      @load_cart_page = true

      # 1. if there is an item, add to cart
      if params[:item]

        # 2. create session cart if there is none
        if !session[:cart]
          session[:cart] = Hash.new
        end#--end 2

        # 3. add to cart
        # check if the car id is already in the cart
        if session[:cart].key?(params[:item])

          # 4. check if there is a quantity item
          if params[:quantity]

            # 5.delete item if quantity is zero
            if params[:quantity].to_i == 0

              session[:cart].delete(params[:item])

            else

              # update the quantity by the amount passed
              session[:cart][params[:item]] = params[:quantity]

            end#--end 5

          # 4.1 if there is not a quantity param
          else

            # update quantity by 1
            session[:cart][params[:item]] += 1

          end#--end 4

        # if the car is not in the cart, just add it
        else

          session[:cart][params[:item]] = 1

        end#--end 3

        # redirect
        # redirect_to cars_path(params[:item])

      end#--end 1

      # # DC - check if there was a delete request
      # if params[:delete_item]
      #   session[:cart].delete(params[:item])
      # end#--end of DC

    end#--end of CE

  end#--end of show FUNCTION

end#--end of pages CONTROLLER
