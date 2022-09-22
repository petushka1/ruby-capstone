def user_choice(app)
  choice = gets.chomp
  case choice
  when '1'
    app.list_all_books
  when '2'
    # something here
  when '3'
    app.add_new_book
  when '6'
    app.add_music_album
  when '7'
    app.save_state
    return true
  end
  false
end
