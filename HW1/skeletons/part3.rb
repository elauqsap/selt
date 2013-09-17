# Dessert class contains the name
# and the calories of the Dessert.
# There are two methods besides the
# accessor methods that allow the 
# user to determine if it is healthy
# or if it is delicious
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

# JellyBean extends Dessert to include
# flavor as well as to override delicious
# to check for a certain flavor because
# no one likes "black licorice"
class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    @name,@calories,@flavor = name,calories,flavor  
  end
  
  def delicious?
    !(@flavor =~ /black\s*?licorice/i)
  end
end
