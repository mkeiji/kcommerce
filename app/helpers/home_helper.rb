module HomeHelper

    # Extracts the name of the image file by
    # deleting the file full path
    # @param (Car obj) car_object_from_db: 
    # @return (String) car_image_file_name
    def extract_car_image_filename (car_object_from_db)

        # extract the image file name
        car_image_file_name = car_object_from_db.image.to_s.sub!("/app/app/assets/images/", "")

        return car_image_file_name
        
    end#--end of extract_car_image_filename FUNCTION

end#--end of HomeHelper MODULE
