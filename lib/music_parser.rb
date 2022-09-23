require_relative 'genre'
require_relative 'music_album'
require_relative 'music_to_file'
require_relative 'music_from_file'

module MusicParser
  def add_music_album
    puts "\nTo add a music album, please enter: "
    album_name = get_input(['Name of album?: '])
    published_date = get_input(['Publish date in the format [YYYY-MM-DD]: '])
    on_spotify = get_input(['Is the album on spotify? [Y/n]: '])
    puts "\nWhat genre is it? Choose and option below:"
    genre = get_input(["[1] Rock\n", "[2] Hip Hop\n", "[3] Jazz\n", "[4] Country\n"])

    genre = case genre
            when '1'
              'Rock'
            when '2'
              'Hip Hop'
            when '3'
              'Jazz'
            when '4'
              'Country'
            else
              'Unspecified'
            end

    on_spotify = on_spotify.upcase == 'Y'
    music_album = MusicAlbum.new(published_date, album_name, on_spotify: on_spotify)

    pre_existing_genre = @music_albums.select do |item|
      item.genre.name == genre
    end

    if pre_existing_genre.length.zero?
      genre = Genre.new(genre)
      @genres << genre
    else
      genre = pre_existing_genre[0].genre
    end

    genre.add_item(music_album)
    @music_albums << music_album

    puts "Music album added sucessfully!!\n\n"
  end

  def list_all_music_albums
    return 'No music albums found' if @music_albums.empty?

    puts "\n"
    @music_albums.each_with_index do |album, i|
      puts "#{i}: \tAlbum name: #{album.name}, PUBLISHED ON: #{album.publish_date},",
           "\tON SPOTIFY?: #{album.on_spotify}, ",
           "\tGENRE: #{album.genre.name}, ARCHIVED?: #{album.archived}"
    end
    puts "\n\n"
  end

  def list_all_genres
    @genres.each do |genre|
      puts "\n#{genre.name}:"
      genre.items.each_with_index do |album, i|
        puts "#{i}: \tAlbum name: #{album.name}, PUBLISHED ON: #{album.publish_date},",
             "\tON SPOTIFY?: #{album.on_spotify}, ",
             "\tGENRE: #{album.genre.name}, ARCHIVED?: #{album.archived}"
      end
    end
    puts "\n\n"
  end

  def music_to_file(app)
    save_music_data(app)
  end

  def music_from_file(app)
    get_music_from_file(app)
  end

  def get_input(questions = [])
    questions.each { |question| print question }
    gets.chomp
  end
end
