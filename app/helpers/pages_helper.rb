module PagesHelper

    # get car's category name based on the car object
    # @param (Car Object) car_object
    # @return (String)
    def get_car_category_name (car_object)

        category_name = Category.find(car_object.category_id).name

        return category_name

    end#--end of get_car_category_name FUNCTION

end#--end of PagesHelper MODULE
