require_relative './spec_helper'
require_relative '../lib/genre'

describe Genre do
  subject { described_class.new('Hip Hop') }

  describe '#new' do
    it 'checks instance of Genre' do
      expect(subject.class).to eql Genre
    end
  end

  describe '#add_item' do
    before (:each) do 
      @item= double('Item', :genre => "")
    end

    it 'should take an instance of the Item class as an input' do 
      subject.add_item(@item)
      expect(subject.items[0]).to eql @item
    end 

    it 'should add the input item to the collection of items' do 
      expect(subject.items.length).to eql 0
      subject.add_item(@item)
      expect(subject.items.length).to eql 1
    end 

    it 'should add self as a property of the item object' do 
      subject.add_item(@item)
      expect(subject).to eql @item.genre
    end 
  end
end