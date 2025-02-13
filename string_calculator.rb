class StringCalculator
  attr_accessor :input_string

  def initialize(input_string)
    @input_string = input_string
  end

  def add
		return 0 if input_string.nil? || input_string.empty?
		return input_string.to_i if input_string.size == 1

		covert_input_string_to_array.sum(&:to_i)
  end

	def covert_input_string_to_array
		input_array = input_string.split(',')
		input_array.map { |elem| elem.split('\n') }.compact.flatten
	end
end