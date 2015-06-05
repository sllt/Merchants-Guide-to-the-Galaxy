require_relative 'env'
# require_relative 'martian'
require_relative 'conversion'

class Query
  attr_accessor :query
  attr_accessor :env

  def initialize
    @env = Env.new
  end

  def execute
    print_header
    while true
      print_query
      case gets
      when /^([a-z]+) is ([I|V|X|L|C|D|M])$/

        @env.add_martians(Martian.new($1, $2))
      when /((\w+ )+)is (\d+) Credits/
        arr_tmp = $1.split
        metal = arr_tmp.last
        martians = arr_tmp - [arr_tmp.last]
        obj = @env.get_martians_obj(martians)
        conversion = Conversion.new(obj + [metal], $3.to_i)
        price = conversion.get_base_metal_price
        @env.add_metals(metal, price)
      when /^how many Credits is ((\w+ )+)([A-Z]\w+) \?$/
        i = @env.get_integer_from_martian($1.split)
        puts @env.get_metals($3, i)
      when /^how much is ((\w+ )+)\?$/
        puts @env.get_integer_from_martian($1.split)
      else 
        puts "I have no idea what you are talking about"
      end
    end
  end

  def print_header
    puts "please input query:"
  end

  def print_query
    puts @query
  end
end