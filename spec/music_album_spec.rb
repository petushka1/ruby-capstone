require_relative '../lib/music_album'

describe MusicAlbum do
  describe '#new' do
    it 'checks instance of MusicAlbum' do
      music_album = MusicAlbum.new('2020/07/07', on_spotify: true, )
      expect(music_album.class).to eql MusicAlbum
    end
  end
end
