require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  counter = 0
  array = []
  charset = [*"A".."Z"]
  while counter < grid_size
    array << charset.sample(1)
    counter += 1
  end
  return array
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  api = parsing_json(attempt)
  time = end_time - start_time
  if api["found"] == false
    hash_not_english = {time: time.to_i, score: 0, message: "not an english word"}
    return hash_not_english
  elsif attempt.upcase!.chars.all? {|char| attempt.count(char) <= grid.count(char)}
    hash_valid = {time: time.to_i, score: (attempt.size / time).to_i, message: "well done"}
    return hash_valid
  else
    hash_not_grid = {time: time.to_i, score: 0, message: "not in the grid"}
    return hash_not_grid
  end
end

def parsing_json(attempt)
  url = "https://wagon-dictionary.herokuapp.com/#{attempt}"
  serialized_valid = URI.open(url).read
  api_json = JSON.parse(serialized_valid)
  return api_json
end
