def horse_racing_format!(race_array)
  # TODO: modify the given array so that it is horse racing consistent. This method should return nil.
  #modificar la array del argumento
  #el metodo debe invertir la array
  #anteponer la posicion del caballo
  #y agregar un signo de exclamacion al final de la cadena del nombre del caballo
  copy = race_array.reverse!
  race_array.each_with_index do |horse, index|
    idx = "#{index + 1}"
    horse_race = "#{horse << "!"}"
  end
  return race_array


end
