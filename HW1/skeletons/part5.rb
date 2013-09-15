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
