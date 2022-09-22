require_relative 'genre'
require_relative 'music_album'

module MusicParser
	def add_music_album
		puts "\nTo add a music album, please enter: "
		published_date = get_input(['Publish date in the format [YYYY-MM-DD]: '])
		on_spotify = get_input(['Is the album on spotify? [Y/n]: '])
		puts "\nWhat genre is it? Choose and option below:"
		genre = get_input(["[1] Rock\n", "[2] Hip Hop\n", "[3] Jazz\n", "[4] Country\n"])

		case genre
		when '1'
			genre = 'Rock'
		when '2'
			genre = 'Hip Hop'
		when '3'
			genre = 'Jazz'
		when '4'
			genre = 'Country'
		else 
			genre = 'Unspecified'
		end

		on_spotify = on_spotify.upcase == 'Y' 
		music_album = MusicAlbum.new(published_date, on_spotify:on_spotify)

		pre_existing_genre = @music_albums.select do |item|
			item.genre.name == genre
		end

		if (pre_existing_genre.length == 0)
			genre = Genre.new(genre) 
			@genres << genre
		else
			genre = pre_existing_genre[0].genre
		end

		genre.add_item(music_album)
		@music_albums << music_album
	end

	def list_all_music_albums
		return 'No music albums found' if @music_albums.empty?

		puts "\n"
		@music_albums.each_with_index do |music_album, i|
			puts "#{i}: \tPUBLISHED ON: #{music_album.publish_date}, ON SPOTIFY?: #{music_album.on_spotify}, ", 
					"\tGENRE: #{music_album.genre.name}, ARCHIVED?: #{music_album.archived}"
		end
		puts "\n\n"
	end

	def list_all_genres
		@genres.each do |genre|
			puts "\n#{genre.name}:"
			genre.items.each_with_index do |music_album, i|
				puts "#{i}: \tPUBLISHED ON: #{music_album.publish_date}, ON SPOTIFY?: #{music_album.on_spotify}, ", 
					"\tGENRE: #{music_album.genre.name}, ARCHIVED?: #{music_album.archived}"
			end
		end
	end 

	def get_input(questions = [])
	  questions.each { |question| print question }
	  gets.chomp
	end
end