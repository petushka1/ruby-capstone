require_relative 'genre'
require_relative 'music_album'

module MusicParser
	def add_music_album
		puts "\nTo add a music album, please enter: "
		published_date = get_input(['Publish date in the format [YYYY-MM-DD]: '])
		on_spotify = get_input(['Is the album on spotify? [Y/n]: '])
		genre = get_input(['What genre is it?: '])

		on_spotify = on_spotify.upcase == 'Y' 
		music_album = MusicAlbum.new(published_date, on_spotify:on_spotify)
		genre = Genre.new(genre)
		genre.add_item(music_album)
	end

	def get_input(questions = [])
	  questions.each { |question| print question }
	  gets.chomp
	end
end