module ApplicationHelper

  # Extracts the name of the image file by
  # deleting the file full path
  # @param (Car obj) car_object_from_db:
  # @return (String) car_image_file_name
  def extract_car_image_filename (car_object_from_db)

    # image location
    path = Rails.root.to_s + '/app' + '/assets' + '/images/'

    # extract the image file name
    car_image_file_name = car_object_from_db.image.to_s.sub!(path, "")
    return car_image_file_name

  end#--end of extract_car_image_filename FUNCTION


  # Limits the length of the string
  # @param (String) string_to_put_limitation
  # @param (Integer) max_length
  # @return (String) limited_string
  def limit_text_length (string_to_put_limitation, max_length)

    if string_to_put_limitation.length > max_length

      limited_string = string_to_put_limitation[0..max_length].gsub(/\s\w+\s*$/,'...')

      return limited_string

    else

      return string_to_put_limitation

    end#string size check

  end#--end of limit_text_length FUNCTION


  # sums the values of a hash array
  # @param (String) hash_array
  # @return (String) sum
  def sum_hash_array_values (hash_array)

    sum = 0

    hash_array.each do |key, value|

      sum += value.to_i

    end

    return sum

  end#--end of limit_text_length FUNCTION

  # formats percent number to string percent
  # @param: (float) amount - amount to be formated
  # return: string
  def to_str_percent(amount)

    percent = amount * 100

    return format("%2.2f\%", percent)

  end

  # formats amount to currency using ruby Money
  # @param: (float) amount - amount to be formated
  # return: void
  def to_currency(amount)

    decimal = BigDecimal.new(amount.to_s)

    full_integer = (decimal * 100)

    return currency = Money.new(full_integer)

  end


  # convert float to string currency
  # @param: (float) amount - amount to be formated
  # return: void
  def to_str_currency(amount)

    amount_fix = amount * 100

    return Money.new(amount_fix, "CAD").format

  end


end#--end of ApplicationHelper MODULE
