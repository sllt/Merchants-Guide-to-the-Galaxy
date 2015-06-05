require_relative 'metal'
require_relative 'martian'

class Combination
  def initialize(object)
    @combination = object
  end

  def get_metals
    @combination.last
  end

  def get_martians
    @combination - [@combination.last]
  end

end