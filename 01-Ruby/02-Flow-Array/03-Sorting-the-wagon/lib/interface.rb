require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/core-2.7.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/core-2.7.5/String.html#method-i-chomp

name_array = []
answer = nil

until answer == ""
  puts "Type another student name or press enter to finish"
  answer = gets.chomp
  name_array << answer unless answer == ""
end
puts name_array


if name_array.count == 1
  puts wagon_sort(name_array)[0]
  puts "Congratulations! Your Wagon has #{name_array.count} student:"
else
  puts wagon_sort(name_array)[0..-2].join(", ") << " and " << wagon_sort(name_array)[-1]
  puts "Congratulations! Your Wagon has #{name_array.count} students:"
end

