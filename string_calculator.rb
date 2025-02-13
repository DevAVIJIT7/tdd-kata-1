class StringCalculator
  class NegativeError < StandardError; end;

  @@called_count = 0
  attr_accessor :input_string
	  
	BASE_DELIMETERS = [',', '\n']

  def initialize(input_string)
    @input_string = input_string
    @called_count = 0
  end

  def add
    @@called_count += 1
		return 0 if input_string.nil? || input_string.empty?
		return input_string.to_i if input_string.size == 1

    converted_array = covert_input_string_to_array
    negative_array = converted_array.select { |elem| elem.to_i < 0 }

    raise NegativeError, "negatives not allowed #{negative_array.join(',')}" unless negative_array.empty?

		covert_input_string_to_array.sum(&:to_i)
  end

  def get_called_count
    @@called_count
  end
  
  private
  
    def covert_input_string_to_array
      new_string = input_string
      if contains_custom_delimeter?
        delimeter = custom_delimeter
        BASE_DELIMETERS << delimeter
        start_index = "//#{delimeter}\n".size
        new_string = input_string[start_index+1..]
      end
      
      split_string(new_string)
    end

    def contains_custom_delimeter?
      input_string[0..1] == '//'
    end

    def custom_delimeter
      input_string[2]
    end

    def split_string(new_string)
      sub_array = new_string.split(BASE_DELIMETERS[0])
      index = 1
      while index < BASE_DELIMETERS.size do
        sub_array = sub_array.map { |elem| elem.split(BASE_DELIMETERS[index]) }.compact.flatten
        index += 1
      end
      sub_array
    end
end