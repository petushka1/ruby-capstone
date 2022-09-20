require_relative 'item'

class Book < Item
    def initialize (publisher, cover_state, publish_date)
        super(publish_date='unknown')
        @publisher = publisher
        @cover_state = cover_state
    end
end