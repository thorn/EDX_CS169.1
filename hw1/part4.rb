class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name     = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    @flavor = flavor
    super(name, calories)
  end

  def delicious?
    return false if @flavor == 'black licorice'
    super
  end
end
