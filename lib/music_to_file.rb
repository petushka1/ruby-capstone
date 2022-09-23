require 'json'

def save_music_albums(music_albums)
  albums = music_albums.map do |album|
    {
      name: album.name,
      genre: album.genre.name,
      publish_date: album.publish_date,
      on_spotify: album.on_spotify,
      id: album.id
    }
  end

  JSON.dump(albums, File.open('./database/music_albums.json', 'w'))
end

def save_genres(genres)
  genre_map = genres.map do |genre|
    items = genre.items.map do |album|
      {
        name: album.name,
        genre: album.genre.name,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        id: album.id
      }
    end
    {
      name: genre.name,
      items: items
    }
  end
  JSON.dump(genre_map, File.open('./database/genres.json', 'w'))
end

def save_music_data(item)
  save_music_albums(item.music_albums)
  save_genres(item.genres)
end
