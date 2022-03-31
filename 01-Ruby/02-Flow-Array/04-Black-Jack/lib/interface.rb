require_relative "croupier"
# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card
player_score = 0
player_answer = nil
bank_score = pick_bank_score
  while player_answer != "no" || player_answer > 21
    puts "enter no para salir, yes o y para pedir cartas"
    player_answer = gets.chomp
    if player_answer == "yes" || player_answer == "y"
      player_score += pick_player_card
      bank_score
      puts state_of_the_game(player_score, bank_score)
    elsif player_answer == "no" || player_answer == "n"
      puts end_game_message(player_score, bank_score)
    end
  end
