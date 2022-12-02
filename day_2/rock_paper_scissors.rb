def rock_paper_scissors(player_choice, opponent_choice)
  if player_choice == 'X' && opponent_choice == 'C'
    return 6
  elsif player_choice == 'Y' && opponent_choice == 'A'
    return 6
  elsif player_choice == 'Z' && opponent_choice == 'B'
    return 6
  elsif player_choice == 'X' && opponent_choice == 'A'
    return 3
  elsif player_choice == 'Y' && opponent_choice == 'B'
    return 3 
  elsif player_choice == 'Z' && opponent_choice == 'C'
    return 3
  else
    return 0
  end
end

def play_round(strategy_guide)
  record_scores = []
  shape_score = {X: 1, Y: 2, Z: 3}
  for round in strategy_guide
    round_score = 0
    player_choice = round.split(" ")[1]
    opponent_choice = round.split(" ")[0]
    round_score = rock_paper_scissors(player_choice, opponent_choice)
    record_scores.append(round_score + shape_score[player_choice.to_sym])
  end
  return record_scores.inject {|sum, num| sum += num}
end


strategy_guide = File.open('strategy_guide.txt','r') do |file|
  file.readlines.join
end

p play_round(strategy_guide.split("\n"))