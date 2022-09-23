require_relative 'item'

class Book < Item
  attr_accessor :cover_state, :publisher, :id

  def initialize(publisher, publish_date, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    return super unless @cover_state == 'bad'

    false
  end
end
