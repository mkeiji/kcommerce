module ApplicationHelper

    # Extracts the name of the image file by
    # deleting the file full path
    # @param (Car obj) car_object_from_db:
    # @return (String) car_image_file_name
    def extract_car_image_filename (car_object_from_db)
      
        # extract the image file name
        car_image_file_name = car_object_from_db.image.to_s.sub!("/app/app/assets/images/", "")
        return car_image_file_name

    end#--end of extract_car_image_filename FUNCTION


    # Limits the length of the string
    # @param (String) string_to_put_limitation
    # @return (String) limited_string
    def limit_text_length (string_to_put_limitation)

        if string_to_put_limitation.length > 80

            limited_string = string_to_put_limitation[0..80].gsub(/\s\w+\s*$/,'...')

            return limited_string

        else

            return string_to_put_limitation

        end#string size check

    end#--end of limit_text_length FUNCTION

end#--end of ApplicationHelper MODULE
