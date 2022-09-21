class Genre
	attr_accessor :name
	attr_reader :items
	def initialize(name)
		@id = Random.rand(1...1000)
		@name = name
		@items = []
	end

	def add_item(item)
		item.genre = 'test'
		p item.genre
		@items << item
	end
end