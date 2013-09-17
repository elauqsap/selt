# Given two arrays, this class will
# compute the Cartesian Product of
# the two arrays. The method each
# allows the user to enumerate the
# values of two array product.
class CartesianProduct
  include Enumerable

  def initialize (rows, cols)
  	@rows,@cols = rows,cols
  end

  def each
    return to_enum unless block_given?
    @rows.each do |row| 
      @cols.each do |col|
      	yield [row,col]
      end
  	end
  end

end
