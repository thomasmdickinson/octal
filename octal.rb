class Octal
  attr_reader :value_str

  def initialize(str)
    @value_str = str
  end

  def to_decimal
    total = 0
    if valid_octal?
      reverse_split.each_with_index { |num, idx| total += num.to_i * (8**idx) }
    end
    total
  end

  private

  def split
    @value_str.split(//)
  end

  def reverse_split
    split.reverse
  end

  def valid_octal?
    split.each do |char|
      digit = char.to_i
      return false unless (char == '0' || digit != 0) && digit < 8
    end
    true
  end
end
