class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title = 'unknown', color = 'unknown')
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
