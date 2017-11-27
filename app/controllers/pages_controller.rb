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

    end#--end of CE


    # for CHECKOUT page
    # ------------------------------------
    # CC - check if is a checkout page request
    if params[:checkout]

      # set load checkout page flag
      @load_checkout_page = true

      # CP - check if user has a customer profile
      if Customer.exists?(User.find(params[:user]).customer_id)
        @cust_obj = User.get_user_customer_obj(params[:user])
        @cust_id = User.find(params[:user]).customer_id
        @cust_pst = Province.get_pst(@cust_obj.province_id)
        @cust_gst = Province.get_gst(@cust_obj.province_id)
        @cust_hst = Province.get_hst(@cust_obj.province_id)

        # CU - check if there is a user update request
        if params[:update_customer]
          @cust_obj.update(first_name: params[:first_name])
          @cust_obj.update(last_name: params[:last_name])
          @cust_obj.update(address: params[:address])
          @cust_obj.update(city: params[:city])
          @cust_obj.update(postal_code: params[:postal_code])
          @cust_obj.update(province_id: params[:province_id])

          # update the taxes values
          @cust_pst = Province.get_pst(@cust_obj.province_id)
          @cust_gst = Province.get_gst(@cust_obj.province_id)
          @cust_hst = Province.get_hst(@cust_obj.province_id)
        end#--end CU

      else
        @cust_obj = false
      end#--end CP



    end#--end CC


  end#--end of show FUNCTION

end#--end of pages CONTROLLER
