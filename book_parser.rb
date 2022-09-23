require 'json'
require_relative 'book'
require_relative 'label'

module BookParser # rubocop:disable Metrics
  def books_to_file
    book_obj = @books.map do |book|
      {
        publisher: book.publisher,
        publish_date: book.publish_date,
        cover_state: book.cover_state,
        id: book.id,
        label_id: book.label.id
      }
    end
    File.write('./database/books.json', book_obj.to_json)
  end

  def read_books_from_file
    file = File.read('./database/books.json')
    read_books = JSON.parse(file)
    read_books.each do |book|
      restored_book = Book.new(book['publisher'], book['publish_date'], book['cover_state'])
      @books << restored_book
      restored_book.id = book['id']
      label = @labels.find { |l| l.id == book['label_id'] }
      label.add_item(restored_book)
    end
  rescue StandardError
    puts 'no books was saved'
  end

  def labels_to_file
    labels_obj = @labels.map do |label|
      {
        title: label.title,
        color: label.color,
        id: label.id
      }
    end
    File.write('./database/labels.json', labels_obj.to_json)
  end

  def read_labels_from_file
    file = File.read('./database/labels.json')
    read_labels = JSON.parse(file)
    read_labels.each do |label|
      restored_label = Label.new(label['title'], label['color'])
      @labels << restored_label
      restored_label.id = label['id']
    end
  rescue StandardError
    puts 'no labels was saved'
  end

  def add_new_book
    book = create_new_book
    label = add_new_label
    label.add_item(book)
    @books << book
    puts "\nNew book added"
    print "\n[NEW] ID: #{book.id}, Publisher: #{book.publisher}, Publish date: #{book.publish_date}, "
    print "Cover state: #{book.cover_state}"
  end

  def create_new_book
    puts 'To add a new book please enter:'
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'Publish Date in format "YY-MM-DD":'
    publish_date = gets.chomp
    puts 'Cover state:'
    state = gets.chomp
    Book.new(publisher, publish_date, state)
  end

  def add_new_label
    if @labels.empty?
      create_label
    else
      puts 'Choose Label from the list [1] or create a new Label [2]'
      choice = gets.chomp
      case choice
      when '1'
        select_label
      when '2'
        create_label
      end
    end
  end

  def create_label
    puts 'Add Label title'
    title = gets.chomp
    puts 'Add Label color'
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    @labels.last
  end

  def select_label
    @labels.map.with_index do |label, index|
      puts "[#{index}] #{label.title} [color: #{label.color}]"
    end
    choice = gets.chomp.to_i
    return 'Select Label from the list' unless choice.between?(0, @labels.length - 1)

    @labels[choice]
  end

  def save_state
    books_to_file
    labels_to_file
  end

  def load_state
    read_labels_from_file
    read_books_from_file
  end
end
