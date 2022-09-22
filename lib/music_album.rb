require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(published_date, album_name, on_spotify: false)
    super(published_date)
    @on_spotify = on_spotify
    @name = album_name
    can_be_archived?
  end

  private

  def can_be_archived?
    @on_spotify && super
  end
end
