require 'roman_numeral'

describe RomanNumeral do
  it "should return the arabic" do
    @roman_numeral = RomanNumeral.new('VI')
    @roman_numeral.to_integer.should == 6

    @roman_numeral = RomanNumeral.new('M')
    @roman_numeral.to_integer.should == 1000

  end

  it "should raise for invalid roman number" do
    lambda{RomanNumeral.new('1234').to_integer}.should raise_error(StandardError, 'Roman numeral is invalid')

    lambda{RomanNumeral.new('CCCC').to_integer}.should raise_error(StandardError, 'Roman numeral is invalid')

  end
end

