require 'json'
require_relative 'book'

module Parser
  def books_to_file
    book_obj = @books.map do |book|
      {
        publisher: book.publisher,
        publish_date: book.publish_date,
        cover_state: book.cover_state,
        id: book.id
      }
    end
    File.write('./database/books.json', book_obj.to_json)
  end

  def read_books_from_file
    file = File.read('./database/books.json')
    read_books = JSON.parse(file)

    read_books.each do |book|
      @books << Book.new(book['publisher'], book['publish_date'], book['cover_state'])
      @books.last.id = book['id']
    end
  rescue StandardError
    puts 'no books was saved'
  end

  def add_new_book
    puts 'To add a new book plese enter:'
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'Publish Date in format "YY-MM-DD":'
    publish_date = gets.chomp
    puts 'Cover state:'
    state = gets.chomp
    @books << Book.new(publisher, publish_date, state)
    puts 'New book added'
  end

  def save_state
    books_to_file
  end

  def load_state
    read_books_from_file
  end
end
