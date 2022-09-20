require_relative '../lib/music_album'

describe MusicAlbum do
  describe '#new' do
    it 'checks instance of MusicAlbum' do
      music_album = MusicAlbum.new(on_spotify: true)
      expect(music_album.class).to eql MusicAlbum
    end
  end
end
