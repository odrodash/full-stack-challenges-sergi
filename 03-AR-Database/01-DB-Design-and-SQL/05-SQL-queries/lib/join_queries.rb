require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<-SQL
    SELECT tracks.name, albums.title, artists.name
    FROM tracks
    JOIN artists ON albums.artist_id = artists.id
    JOIN albums ON tracks.album_id = albums.id
  SQL

  list = db.execute(query)
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)

  query = <<-SQL
    SELECT genres.name, COUNT(*), round(AVG(milliseconds)/60000,2)
    FROM tracks
    JOIN genres ON tracks.genre_id = genres.id
    WHERE genres.name = '#{genre_name}'
  SQL

  result = db.execute(query).flatten

  hash = {category: result[0], number_of_songs: result[1], avg_length: result[2]}

  return hash

end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<-SQL
    SELECT artists.id , artists.name, COUNT(*)
    FROM tracks
    JOIN genres ON tracks.genre_id = genres.id
    JOIN albums ON tracks.album_id = albums.id
    JOIN artists ON albums.artist_id = artists.id
    WHERE genres.name = '#{genre_name}'
    GROUP BY artists.name
    ORDER BY COUNT(*) DESC
    LIMIT 5
  SQL

  top = db.execute(query)
end
