class StringCalculator
  attr_accessor :numbers

  def initialize(numbers)
    @numbers = numbers
  end

  def calculator
		return 0 if numbers.nil? || numbers.empty?
		return numbers.to_i if numbers.size == 1
  end
end