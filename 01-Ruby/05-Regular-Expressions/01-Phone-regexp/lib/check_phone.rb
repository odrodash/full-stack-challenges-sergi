def french_phone_number?(phone_number)
  pattern_0_if_10_digit = /\+?(0[1-9]){1}\s?\-?\d{2}\s?\-?\d{2}\s?\-?\d{2}\s?\-?\d{2}/
  pattern_33_if_11_digit = /\+?33{1}\s?\-?[1-9]{1}\s?\-?\d{2}\s?\-?\d{2}\s?\-?\d{2}\s?\-?\d{2}/

  if phone_number.size == 10 || phone_number.size == 14
    pattern_0_if_10_digit.match?(phone_number)
  elsif phone_number.size == 11 || phone_number.size == 17
    return pattern_33_if_11_digit.match?(phone_number)
  end

end
 #el metodo debe devolver true cuando el numero  frances es valido  o false cuando no lo es
  #es valido cuando empieza 0 y contiene 10 digitos, y el segundo digito no puede ser un 0
  #tambien es valido cuando comienza con +33 y tiene 11 digitos y el digito que sigue a 33 no puede ser un 0
  #el metodo debe ignorar espacio o guiones entre digitos
