require_relative '../lib/genre'

describe Genre do
  describe '#new' do
    it 'checks instance of Genre' do
      genre = Genre.new('R & B')
      expect(genre.class).to eql Genre
    end
  end
end