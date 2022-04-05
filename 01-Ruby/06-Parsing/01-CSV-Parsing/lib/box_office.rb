require 'csv'

def most_successful(number, max_year, file_path)
  # TODO: return the `number` of most successful movies before `max_year`
  array = []
  CSV.foreach(file_path) do |row|
    array.push(name: row[0].to_s, year: row[1].to_i, earnings: row[2].to_i)if row[1].to_i < max_year.to_i
  end
  sorted_array = array.sort_by {|ele| ele[:earnings]}.reverse
  return sorted_array[0, number]
end
