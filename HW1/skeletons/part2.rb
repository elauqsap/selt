class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

# Determines the winner in a two player game of 
# "Rock, Paper, Scissors". Does so by converting
# the array passed into a hash that is then sent 
# to a method to have its values compared to 
# determine a winner.
#
# @game Array stores the players and their strategy
def rps_game_winner(game)
  hash = Hash[*game.flatten()]
  raise WrongNumberOfPlayersError unless (game.length && hash.size) == 2 
  strat_check(hash)
  winner = comp_to(hash)
  puts "#{winner}"
end

# Determines the winner in a 2^n number of players  
# game of "Rock, Paper, Scissors". Does so by converting
# the array passed into a hash that is then sent to a
# recursive method to have its entries compared for
# a winner using a bracket style tournament.
#
# @tournament Array stores the players and their strategy
def rps_tournament_winner(tournament) 
  raise WrongNumberOfPlayersError unless (tournament.length % 2 === 0) && (tournament.length != 0) 
  hash = Hash[*tournament.flatten()]
  strat_check(hash)
  winner = bracket(hash)
  puts "#{winner}"
end

# Compares a hash with two players and their strategies
# for the RPS game. The winner is returned to the caller
# as an array
#
# @hash Hash holds player=>key, strategy=>value pairs
# return Array holds the winner in array format
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

# Recursive method that takes a hash of all the players
# and their strategies. It then plays 1v1 until all the
# values have been iterated over. It creates an array
# of winners that are passed to a recursive call until
# there is only one. The winner is then returned as
# an array
#
# @hash Hash holds player=>key, strategy=>value pairs
# return Array holds the winner in array format
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

# Checks that the player used either Rock, Paper,
# or Scissor and not Death Ray, Atom Bomb, etc.
#
# @hash Hash holds player=>key, strategy=>value pairs
def strat_check(hash)
  return hash unless hash.instance_of?(Hash)
  hash.each do |key, val|
    raise NoSuchStrategyError unless (val =~ /[RSP]/i)
  end
end