def array_to_hash(array)
  # TODO: implement the method :)
  #definir metodo que tome array como parametro y devuelva un hash
  #si no hay un bloque las key deberian ser los index de lo elemento en la matriz  convertidos en string
  #else(si hay bloque) llamar pasandole el index de la array y usar lo que se devuelve como clave hash
  hash = Hash.new
  array.each_with_index do |elem, index|
    key = block_given? ? yield(index) : index.to_s
    hash[key] = elem
  end
  return hash
end
