def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  first_sub_array = array.select {|word| word.length == size }.sort
  second_sub_array = array.reject {|word| word.length == size }.sort
  return [first_sub_array, second_sub_array]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  first_sub_array = array.select {|item| yield(item) }.sort
  second_sub_array = array.reject {|item| yield(item) }.sort
  return [first_sub_array, second_sub_array]
end
