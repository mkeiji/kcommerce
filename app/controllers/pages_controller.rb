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

      # RCC - check if there is a request to create customer
      if params[:create_customer]

        # create the new user
        customer_obj = Customer.create(first_name: params[:first_name],
                                       last_name: params[:last_name],
                                       address: params[:address],
                                       city: params[:city],
                                       postal_code: params[:postal_code],
                                       province_id: params[:province_id])

        # assign the new custoemr to the user
        customer_id = customer_obj.id
        user_obj = User.find(params[:user])
        user_obj.update(customer_id: customer_id)

        # update @cust_obj instance var
        @cust_obj = customer_obj
        # update the taxes values
        @cust_pst = Province.get_pst(@cust_obj.province_id)
        @cust_gst = Province.get_gst(@cust_obj.province_id)
        @cust_hst = Province.get_hst(@cust_obj.province_id)

      else

        @create_cust_error = 'Oops, something went wrong'

      end#--end RCC

    end#--end CC


    # for Place Order and Pay page
    # ------------------------------------
    # PR - check if is a payment page request
    if params[:pay]

      # set pay page flag
      @load_pay_page = true

      # - using STRIPE -
      amount = params[:amount]

      # stripe customer obj
      customer = Stripe::Customer.create(email:  params[:stripeEmail],
                                          source: params[:stripeToken])

      # stripe charge obj
      charge = Stripe::Charge.create(customer:    customer.id,
                                      amount:      amount,
                                      description: 'Payment with Card',
                                      currency:    'cad')
      # - end of  STRIPE -

      # populate order and line_item in the db if payment is ok
      @cust_obj = User.get_user_customer_obj(params[:user])
      order = create_new_order(@cust_obj)
      order_id = order.id

      # AO - add line item to the order
      session[:cart].each do |car_id, qty|

        car = Car.find(car_id.to_i)
        add_line_item_to_order(order, car, qty)

      end#--end AO

      # clear cart
      session[:cart] = Hash.new

      # transaction info
      @paid = charge.paid
      @amount_check = charge.amount.to_i - amount.to_i

      # PC - check if the payment went through and update order status
      if @paid == true && @amount_check == 0

        set_order_status(order, 2)

      end
      #--end PC

    end#--end PR

  end#--end of show FUNCTION

  ############################### AUX FUNCTIONS ####################################

  # creates a new order, backup tax rates and save to db
  # @param (Customer) customer: customer object
  # @return (Order) new_order
  def create_new_order (customer)

    # get current taxes
    ord_pst = Province.get_pst(customer.province_id)
    ord_gst = Province.get_gst(customer.province_id)
    ord_hst = Province.get_hst(customer.province_id)

    # create new order based on the customer foreing key
    new_order = @cust_obj.orders.build

    # populate new order
    new_order.status = 'pending'
    new_order.pst_rate = ord_pst
    new_order.gst_rate = ord_gst
    new_order.hst_rate = ord_hst

    # persist order
    new_order.save

    return new_order

  end#--end create_new_order FUNCTION


  # updates an order status
  # @param (Order) order_obj: order object
  # @param (Integer) status: order status
  #                         1 - pending
  #                         2 - paid
  #                         3 - shipped
  # @return void
  def set_order_status (order_obj, status)

    case status

      when 1
        order_obj.status = 'new'
      when 2
        order_obj.status = 'paid'
      when 3
        order_obj.status = 'shipped'

    end

    # persist change
    order_obj.save

  end#--end set_order_status FUNCTION


  # adds a product to an order by way of a line_item
  # and save it in db
  # @param (Order) order: order object
  # @param (Car) car_obj: car object
  # @param (int) quantity: product quantity
  # @return (LineItem) item
  def add_line_item_to_order (order, car_obj, quantity)

    # create line_item entry with order foreing key
    item = order.line_items.build

    # add item info
    item.order_id  = order.id
    item.car_id  = car_obj.id
    item.price  = car_obj.price
    item.quantity = quantity

    # persist entry
    item.save

    return item

  end #of add_line_item_to_order()


end#--end of pages CONTROLLER
