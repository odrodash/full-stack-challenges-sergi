require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  return "score is: #{player_score}, bank's score is: #{bank_score}."
end

def end_game_message(player_score, bank_score)
  case
  when player_score > 21 || player_score < bank_score
    return "You lose"
  when player_score == 21
    return "Black Jack, You win"
  when player_score > bank_score
    return "You win"
  when player_score == bank_score
    return "You push"
  end
end
