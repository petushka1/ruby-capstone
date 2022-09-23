require 'json'
require_relative './genre'
require_relative './music_album'

def get_music_albums(music_albums)
  if (File.file?('./database/music_albums.json')) 
    data = JSON.parse(File.read('./database/music_albums.json'))

    data.each do |item|
      music_album = MusicAlbum.new(item["publish_date"], item["name"], on_spotify: item["on_spotify"])
      music_album.id = item["id"]
      music_album.genre = item["genre"]
      music_albums << music_album
    end
  end
end

def get_genres(app)
  if (File.file?('./database/music_albums.json')) 
    data = JSON.parse(File.read('./database/genres.json'))
    data.each do |item|
      genre = Genre.new(item["name"])
      app.music_albums.each do |album|
        if (album.genre == genre.name) 
          genre.add_item(album)
        end
      end
      app.genres << genre
    end
  end
end

def get_music_from_file(app)
  get_music_albums(app.music_albums)
  get_genres(app)
end