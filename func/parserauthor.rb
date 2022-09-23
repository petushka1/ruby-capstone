require_relative 'parsermethod'
require_relative '../games_cli'

module HandleAuthor
  include ParserMethod
  include GamesCli

  def save_author
    array = []
    @authors.each do |author|
      array << {
        author_id: author.id,
        first_name: author.first_name,
        last_name: author.last_name,
        Items: author.items.map do |item|
                 {
                   publish_date: item.publish_date,
                   multiplayer: item.multiplayer,
                   last_played_at: item.last_played_at
                 }
               end
      }
    end
    write_json(array, '../database/authors.json')
  end

  def load_author
    parse_file = read_json('../database/authors.json')
    parse_file.each do |author|
      person = Author.new(author['first_name'], author['last_name'])
      @authors << person
      author['Items'].each do |item|
        person.add_item(Game.new(item['publish_date'], item['multiplayer'], item['last_played_at']))
      end
    end
  end
end
