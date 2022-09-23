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
    app.add_game
  when '5'
    app.list_games
  when '6'
    app.list_authors
  when '7'
    app.save_state
    return true
  end
  false
end
