VALID_EMAIL = /^([A-Za-z0-9\-](\.|_)?)+[A-Za-z0-9]\@([A-Za-z0-9]+-?[A-Za-z0-9]+)(\.?[A-Za-z0-9]{2})*\.[a-z]{2,3}$/

def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  email.match?(VALID_EMAIL) ? true : false
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
   valid = emails.select {|email| email.match(VALID_EMAIL)}
   return valid
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  new_hash = {}
  emails.each do |e|
    last_el = e.partition(".").last
    if last_el == e.partition(".").last
      new_hash[last_el] ||= []
      new_hash[last_el] << e
    else
      break
    end
  end
  return new_hash
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  new_hash = {}
  username = email.gsub(/(.+)@([^.]+)\.(.+)/, '\1')
  domain = email.gsub(/(.+)@([^.]+)\.(.+)/, '\2')
  tld = email.gsub(/(.+)@([^.]+)\.(.+)/, '\3')
  new_hash[:username] = username.to_s
  new_hash[:domain] = domain.to_s
  new_hash[:tld] = tld.to_s
  return new_hash
end

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
  new_hash = {}
  username = email.gsub(/(.+)@([^.]+)\.(.+)/, '\1')
  domain = email.gsub(/(.+)@([^.]+)\.(.+)/, '\2')
  tld = email.gsub(/(.+)@([^.]+)\.(.+)/, '\3')
  new_hash[:username] = username.to_s
  new_hash[:domain] = domain.to_s
  new_hash[:tld] = tld.to_s
  new_hash
  if new_hash[:tld] == "com"
    new_hash[:subject] = "Our website is online"
    new_hash[:body] = "Come and visit us!"
    new_hash[:closing] = "See you soon"
    new_hash[:signature] = "The Team"
    return new_hash
  elsif new_hash[:tld] == "fr"
    new_hash[:subject] = "Notre site est en ligne"
    new_hash[:body] = "Venez nous rendre visite !"
    new_hash[:closing] = "A bientot"
    new_hash[:signature] = "L'équipe"
    return new_hash
  elsif new_hash[:tld] == "de"
    new_hash[:subject] = "Unsere Website ist jetzt online"
    new_hash[:body] = "Komm und besuche uns!"
    new_hash[:closing] = "Bis bald"
    new_hash[:signature] = "Das Team"
    return new_hash
  end
end
