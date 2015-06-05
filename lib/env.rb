require_relative "roman_numeral"

class Env
  attr_accessor :martians
  attr_accessor :metals

  def initialize
    @martians = {}
    @metals = {}
  end

  def add_martians(martian)
    @martians[martian.name] = martian
  end

  def get_martians_obj(arr)
    obj = []
    arr.each { |m| obj << @martians[m] }
    obj
  end

  def get_integer_from_martian(arr)
    roman = ''
    arr.each { |m| roman << @martians[m].value }
    RomanNumeral.new(roman).to_integer
  end

  def add_metals(metal, price)
    @metals[metal] = price
  end

  def get_metals(metal, roman_int)
    metals[metal].value * roman_int
  end
end