require_relative 'parser'

class App
  attr_accessor :books, :games, :music_albums

  include Parser

  def initialize
    @books = []
    @games = []
    @music_albums = []
  end

  def list_all_books
    return 'No books found' if @books.empty?

    puts @books
    @books.each do |book|
      print "\n[BOOK][ID][#{book.id}] Publisher: #{book.publisher}," 
      print "Publish date: #{book.publish_date}, Cover state: #{book.cover_state}"
    end
  end
end
