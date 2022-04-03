def array_to_hash(array)
  # TODO: implement the method :)
  hash = Hash.new
  array.each_with_index do |elem, index|
    key = block_given? ? yield(index) : index.to_s
    hash[key] = elem
  end
  return hash
end
