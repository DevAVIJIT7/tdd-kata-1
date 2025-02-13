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

    converted_array.reduce(0) do |acc, elem|
      acc += if elem.to_i <= 1000
        elem.to_i
      else
        0
      end
    end
  end

  def get_called_count
    @@called_count
  end
  
  private
  
    def covert_input_string_to_array
      new_string = input_string
      if contains_custom_delimeter?
        custom_delimeter
        new_string = input_string.split('\n')[1]
      end
      split_string(new_string)
    end

    def contains_custom_delimeter?
      input_string[0..1] == '//'
    end

    def custom_delimeter
      extracted_delimeter = input_string.split('\n')[0][2..]
      if extracted_delimeter[0] != '['
        BASE_DELIMETERS << extracted_delimeter
        return
      end
      
      if extracted_delimeter.include?('][')
        BASE_DELIMETERS.concat(
          extracted_delimeter.gsub!('][', ',')[1..extracted_delimeter.size-2].split(',')
        )
        return
      end
      BASE_DELIMETERS << extracted_delimeter[1..extracted_delimeter.size-2]
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