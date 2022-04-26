def most_common_words(file_name, stop_words_file_name, number_of_word)
  # TODO: return hash of occurences of number_of_word most frequent words
  file_hash = {}
  sentence = nil
  stop_words_array = []

  File.open(file_name).each_line do |line|
    sentence = line.split
  end

  File.open(stop_words_file_name).each_line do |line|
    new_line = line.gsub("\n",'')
    stop_words_array << new_line
  end



  sentence.each do |word|
    new_word = word.gsub("'s", '')
    new_word.downcase!
    next if stop_words_array.include?(new_word)

    k = file_hash[new_word].nil? ? 0 : file_hash[new_word]
    file_hash[new_word] =  k + 1
  end

  file_hash = file_hash.sort_by{|_k, v| v}.reverse
  return file_hash[0..number_of_word].to_h
end


def load_stop_words(stop_words_filename)
  File.open(stop_words_filename, "r").reduce([]) do |stop_words, line|
    stop_words << line.chomp
  end
end

def most_common_words(filename, stop_words_filename, number_of_word)
  counter = Hash.new(0)

  stop_words = load_stop_words(stop_words_filename)

  File.open(filename, "r").each_line do |line|
    line.chomp.downcase.split(/\W+/).each do |word|
      counter[word] += 1 unless stop_words.include? word
    end
  end

  Hash[counter.sort_by { |_, v| -v }[0..(number_of_word - 1)]]
end

