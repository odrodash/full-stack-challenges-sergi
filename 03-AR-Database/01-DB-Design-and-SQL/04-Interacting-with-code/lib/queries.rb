require 'sqlite3'

db = SQLite3::Database.new("lib/db/jukebox.sqlite")

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  artist_count = db.execute("SELECT COUNT (*) FROM artists")
  artist_count.flatten.first
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  number_of_rows = db.execute("SELECT COUNT (*) FROM #{table_name}")
  number_of_rows.flatten.first
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  sorted_artists = db.execute("SELECT name FROM artists ORDER BY name ASC")
  return sorted_artists.flatten
end

def love_tracks(db)
  # TODO: return array of love songs' names
  love = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'")
  love.flatten
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  long_tracks = db.execute("SELECT name FROM tracks WHERE milliseconds > #{min_length*60000} ORDER BY milliseconds ASC")
  long_tracks.flatten
end
