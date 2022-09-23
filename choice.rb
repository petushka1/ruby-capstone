def user_choice(app)
  choice = gets.chomp
  case choice
  when '1'
    app.list_all_books
  when '2'
    # something here
  when '3'
    app.add_new_book
  when '4'
    app.create_game
  when '5'
    app.game_with_new_author
  when '6'
    app.game_with_existing_author
  when '8'
    app.add_game
  when '9'
    app.list_games
  when '10'
    app.list_authors
  when '7'
    app.save_state
    return true
  end
  false
end
