class CartesianProduct
  include Enumerable

  def initialize(a,b)
    @a = a
    @b = b
  end

  def each
    @a.each{ |a| @b.each{|b| yield [a, b]} }
  end
end

# c = CartesianProduct.new([:a,:b], [4,5])
# c.each { |elt| puts elt.inspect }
