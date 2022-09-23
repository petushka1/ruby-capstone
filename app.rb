require_relative 'parser'
require_relative 'games_cli'
require_relative 'func/parserauthor'
require_relative 'game'
require_relative 'author'

class App
  attr_accessor :books, :games, :music_albums, :authors

  include Parser
  include GamesCli
  include HandleAuthor

  def initialize
    @books = []
    @games = []
    @music_albums = []
    @authors = []


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
