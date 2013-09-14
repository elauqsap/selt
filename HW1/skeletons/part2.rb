class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  #help = HelperMethods.new()
  @hash = Hash.new
  hash = to_hash(game)
  hash.values do |val|
  	puts "#{val}"
  	#raise NoSuchStrategyError unless (val =~ /[RSP]/i)
  end
end

def rps_tournament_winner(tournament) 
  
end

def to_hash(arr)
  return arr unless arr.is_a? Array
  arr.inject({}) do |hash, (key, value)|
  	hash.merge!(key.to_sym => to_hash(value))
  end
end

#class HelperMethods
#	attr_accessor :val
#	def initialize()
#	end
#	def to_hash(arr)
#	  return arr unless arr.is_a? Array
#	  #val = Hash.new
#	  arr.inject({}) do |hash, (key, value)|
#	    hash.merge!(key.to_sym => to_hash(value))
#	    #val.merge!(hash)
#	  end
#	  #return val
#	end
#end
