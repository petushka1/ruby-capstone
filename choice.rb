def user_choice(app)
  choice = gets.chomp
  case choice
  when '1'
    app.list_all_books
  when '2'
    app.list_all_labels
  when '3'
    app.add_new_book
  when '7'
    app.save_state
    return true
  end
  false
end
