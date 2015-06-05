require_relative 'metal'
require_relative 'martian'
require_relative 'combination'
require_relative 'roman_numeral'

class Conversion
  def initialize(object, price=nil)
    @object = object
    @price = price
  end

  def get_base_metal_price
    obj ||= Combination.new(@object)
    metal = obj.get_metals
    unless metal.nil?
      metal_price = @price / get_integer.to_f 
      @metal ||= Metal.new(metal,metal_price)
    end
  end


  def get_roman
    roman = ''
    obj ||= Combination.new(@object)
    martians = obj.get_martians
    martians.each{ |m| roman << m.value if m.is_a?(Martian)}
    roman
  end

  def get_integer
    RomanNumeral.new(get_roman).to_integer
  end
end
