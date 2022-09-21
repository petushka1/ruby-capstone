require_relative 'spec_helper'

describe Game do
  let(:apex) { Game.new('2013-03-05', false, '2020-02-02') }
  let(:fortnite) { Game.new('2014-07-02', true, '2020-02-02') }

  describe '#game class' do
    it 'should be a game class' do
      expect(apex).to be_a(Game)
    end

    it 'should be an instance of a game' do
      expect(apex).to be_an_instance_of(Game)
    end
  end

  describe '#can_be_archived?' do
    it 'return true if game older than 5 yeras and was played last more than 2 years ago' do
      expect(apex.can_be_archived?).to eq(true)
      expect(fortnite.can_be_archived?).to eq(false)
    end

    it 'returns false if not more than 2 years old' do
      expect(apex.can_be_archived?).to eq(false)
    end
  end

  describe '#multiplayer' do
    it 'returns multiplayer' do
      expect(apex.multiplayer).to eql(false)
      expect(fortnite.multiplayer).to eql(true)
    end
  end

  describe '#last_played_at' do
    it 'returns last played' do
      expect(apex.last_played_at).to eql('2020-02-02')
    end
  end

  describe '#publish_date' do
    it 'return published date' do
      expect(apex.publish_date).to eql('2013-03-05')
    end
  end
end