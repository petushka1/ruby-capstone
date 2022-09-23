def user_choice(app)
  choice = gets.chomp
  case choice
  when '1'
    app.list_all_books
  when '2'
    app.list_all_labels
  when '3'
    app.add_new_book
  when '4'
    app.add_game
  when '5'
    app.list_games
  when '6'
    app.list_authors
   when '7'
    app.list_all_music_albums
  when '8'
    app.list_all_genres
  when '9'
    app.add_music_album
  when '10'
    app.save_state
    app.music_to_file(app)
    return true
  end
  false
end
