require_relative 'app'
require_relative 'choice'

def options(_app_instance)
  puts "\n-------------------"
  puts 'Choose and option'
  comands = [
    '[1] List all books',
    '[2] List all labels',
    '[3] Add new book',
    '[4] Add Game',
    '[5] list Game',
    '[6] List Authors',
    '[7] Exit'
  ]

  comands.each do |cmd|
    puts cmd
  end
end

def main
  app = App.new
  app.load_state

  exit = false
  puts 'Welcome to Ruby Capstone Project'
  while exit == false
    options(app)
    exit = user_choice(app)
  end
  puts 'Thank you!'
end

main
