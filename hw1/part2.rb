class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
end

def rps_game_winner(game)
  strategies = %w{R P S}
  raise WrongNumberOfPlayersError unless game.length == 2
  player1 = game[0]
  player2 = game[1]
  raise NoSuchStrategyError unless (strategies.include?(player1[1]) && strategies.include?(player2[1]))

  # return player1 if case of tie
  return player1 if player1[1] == player2[1]

  wins = {"R" => "S", "S" => "P", "P" => "R"}
  {true => player1, false => player2}[wins[player1[1]] == player2[1]]
end

def rps_tournament_winner(tournament)
  return tournament if tournament[0].class == String
  rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end

