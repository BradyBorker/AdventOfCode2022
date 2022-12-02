def rock_paper_scissors(player_choice, opponent_choice)
  interpret_choices = { 'A': 'Rock', 'B': 'Paper', 'C': 'Scissors', 'X': 'Rock', 'Y': 'Paper', 'Z': 'Scissors' }

  return 3 if interpret_choices[player_choice.to_sym] == interpret_choices[opponent_choice.to_sym]

  if player_choice == 'X' && opponent_choice == 'C'
    6
  elsif player_choice == 'Y' && opponent_choice == 'A'
    6
  elsif player_choice == 'Z' && opponent_choice == 'B'
    6
  else
    0
  end
end

def play_round(strategy_guide)
  record_scores = []
  shape_score = { X: 1, Y: 2, Z: 3 }
  strategy_guide.each do |round|
    player_choice = round.split(' ')[1]
    opponent_choice = round.split(' ')[0]
    round_score = rock_paper_scissors(player_choice, opponent_choice)
    record_scores.append(round_score + shape_score[player_choice.to_sym])
  end
  record_scores.inject { |sum, num| sum + num }
end

strategy_guide = File.open('strategy_guide.txt', 'r') do |file|
  file.readlines.join
end

p play_round(strategy_guide.split("\n"))
