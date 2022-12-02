def shape_to_play(game_ending, opponent_choice)
  winning_hand = { 'A' => 2, 'B' => 3, 'C' => 1 }
  losing_hand = { 'A' => 3, 'B' => 1, 'C' => 2}
  shape_score = { 'A' => 1, 'B' => 2, 'C' => 3 }
 
  if game_ending == 'Z'
    # need to win
    winning_hand[opponent_choice]
  elsif game_ending == 'Y'
    # Need to draw
    shape_score[opponent_choice]
  else
    # Need to lose
    losing_hand[opponent_choice]
  end
end

def play_round(strategy_guide)
  record_scores = []
  win_lost_draw = {'X' => 0, 'Y' => 3, 'Z' => 6}
  strategy_guide.each do |round|
    game_ending = round.split(' ')[1]
    opponent_choice = round.split(' ')[0]
    shape_played_score = shape_to_play(game_ending, opponent_choice)
    record_scores.append(win_lost_draw[game_ending] + shape_played_score)
  end
  record_scores.inject { |sum, num| sum + num }
end

strategy_guide = File.open('strategy_guide.txt', 'r') do |file|
  file.readlines.join
end

p play_round(strategy_guide.split("\n"))