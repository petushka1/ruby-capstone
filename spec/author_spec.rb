require_relative 'spec_helper'

describe Author do
  let(:author1) { Author.new('Shaheer', 'Chaudry') }
  let(:apex) { Game.new('2013-03-05', false, '2020-02-02') }
  let(:fortnite) { Game.new('2014-07-02', true, '2020-02-02') }

  describe '#author' do
    it 'return an instance of author class' do
      expect(author1).to be_an_instance_of(Author)
    end

    it 'return authors first name' do
      expect(author1.first_name).to eq('Shaheer')
    end

    it 'return authors last name' do
      expect(author1.last_name).to eq('Chaudry')
    end

    it 'return an array of items' do
      expect(author1.items).to be_an_instance_of(Array)
    end
  end

  describe '#add_item' do
    it 'add the author to the item' do
      author1.add_item(apex)
      expect(apex.author).to eq(author1)
    end

    it 'add an item to the author' do
      author1.add_item(apex)
      expect(author1.items).to include(apex)
    end

    it 'return number of elements in the array' do
      author1.add_item(apex)
      author1.add_item(fortnite)
      expect(author1.items).to include(apex, fortnite)
      expect(author1.items.size).to eql(2)
    end

    it 'should return an array of items' do
      author1.add_item(apex)
      author1.add_item(fortnite)
      expect(author1.items).to be_an_instance_of(Array)
    end
  end
end
