class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  hash = Hash[*game.flatten()]
  strat_check(hash)
  win = comp_to(hash)
  puts "#{win}"
end

def rps_tournament_winner(tournament) 
  raise WrongNumberOfPlayersError unless tournament.length % 2 === 0 
  hash = Hash[*tournament.flatten()]
  strat_check(hash)
  win = bracket(tournament)
  puts "#{win}"
end

def comp_to(hash)
  return hash unless hash.instance_of?(Hash)
  if (hash.values[0] == hash.values[1])
    return hash.to_a[0]
  elsif ((hash.values[0] == "P") && (hash.values[1] == "R") \
    || (hash.values[0] == "S") && (hash.values[1] == "P") \
    || (hash.values[0] == "R") && (hash.values[1] == "S"))
    return hash.to_a[0]
  else
    return hash.to_a[1]
  end
end

def bracket(arr)
  return arr unless hash.instance_of?(Array)
  i = 0
  splicer = arr.each_slice(arr.size/2)
  splicer.each do |entry|
    next_round[i] = comp_to(Hash[*entry])
  end
  if (next_round.size != 1)
    bracket(next_round)
  else
    return next_round
  end
end

def strat_check(hash)
  return hash unless hash.instance_of?(Hash)
  hash.each do |key, val|
    raise NoSuchStrategyError unless (val =~ /[RSP]/i)
  end
end

def to_hash(arr)
  return arr unless arr.instance_of?(Array)
  arr.inject({}) do |hash, (key, value)|
  	hash.merge!(key.to_sym => to_hash(value))
  end
end