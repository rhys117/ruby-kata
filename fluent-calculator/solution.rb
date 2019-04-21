class Calc
  attr_reader :first_value, :second_value

  def initialize
    @numbers = []
    @operation = nil
  end

  word_numbers = %w(one two three four five six seven eight nine)
  (1..9).each_with_index do |num, index|
    define_method(word_numbers[index]) {
      @numbers << num
      @numbers.length == 2 ? perform_calculation : self
    }
  end

  OPERATORS = {
      'plus'       => '+',
      'minus'      => '-',
      'times'      => '*',
      'divided_by' => '/'
  }

  OPERATORS.keys.each do |operator|
    define_method(operator) {
      @operation = OPERATORS[operator]
      self
    }
  end

  def perform_calculation
    @numbers.first.send(@operation, @numbers.last)
  end
end