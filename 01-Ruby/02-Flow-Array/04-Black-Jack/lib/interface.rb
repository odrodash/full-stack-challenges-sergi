require_relative "croupier"
# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

  puts "type 1 for choose a card or type yes for leave"
  card = gets.chom

  while card.downcase == "yes"
    card.to_i =
