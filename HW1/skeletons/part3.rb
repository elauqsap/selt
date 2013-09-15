class Dessert
  attr_accessor :name,:calories
  def initialize(name, calories)
    @name,@calories = name,calories
  end
  
  def healthy?
    !!(@calories < 200)
  end
  
  def delicious?
    !!(self.class == Dessert)
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    @name,@calories,@flavor = name,calories,flavor  
  end
  
  def delicious?
    !(@flavor =~ /black\s*?licorice/i)
  end
end
