class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  hash = Hash[*game.flatten()]
  raise WrongNumberOfPlayersError unless (game.length && hash.size) == 2 
  strat_check(hash)
  win = comp_to(hash)
  puts "#{win}"
end

def rps_tournament_winner(tournament) 
  raise WrongNumberOfPlayersError unless tournament.length % 2 === 0 
  hash = Hash[*tournament.flatten()]
  strat_check(hash)
  win = bracket(hash)
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

def bracket(hash)
  return hash unless hash.instance_of?(Hash)
  h_len = hash.length
  next_round = Array.new
  arr = Array.new
  for x in 0..h_len
    arr.push(hash.entries[x])
    if (x % 2 === 1)
      next_round.push(comp_to(Hash[*arr.flatten()]))
      arr.clear
    end
  end 
  if (next_round.size != 1)
    bracket(Hash[*next_round.flatten()])
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