require_relative 'spec_helper'

describe Label do
  before :each do
    @label = Label.new('Label', 'Colorful')
  end

  context 'check initialized values' do
    it 'should have title to equal Label and color to equal Colorful' do
      expect(@label.title).to eq 'Label'
      expect(@label.color).to eq 'Colorful'
    end
  end

  context 'check one to many relationship' do
    it 'should push itself to item' do
      @item = Item.new('2022-01-02')

      Label.any_instance.stub(id: 435, title: 'NewLabel', color: 'Grayscale')
      @label.add_item(@item)
      expect(@item.label.id).to eq(435)
    end

    it 'should push passed item to self items' do
      @item = Item.new('2022-01-02')
      expect { @label.add_item(@item) }.to change { @label.items.length }.from(0).to(1)
    end
  end
end
