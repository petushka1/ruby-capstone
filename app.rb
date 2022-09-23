require_relative './lib/music_parser'
require_relative 'book_parser'

class App
  attr_accessor :books, :games, :music_albums, :genres

  include MusicParser
  include BookParser

  def initialize
    @books = []
    @games = []
    @labels = []
    @music_albums = []
    @genres = []
  end

  def list_all_books
    return 'No books found' if @books.empty?

    puts @books
    @books.each do |book|
      print "\n[BOOK][ID][#{book.id}] Publisher: #{book.publisher},"
      print "Publish date: #{book.publish_date}, Cover state: #{book.cover_state}"
    end
  end

  def list_all_labels
    return 'No labels found' if @labels.empty?

    @labels.each do |label|
      puts "\n[Label][ID][#{label.id}] Title: #{label.title}, Color: #{label.color}"
    end
  end
end
