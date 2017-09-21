class BoardFactory
  def self.create(data:)
    new(data).create
  end

  attr_reader :data

  def initialize(data)
    @data = data
    @board = Array.new(4) { Array.new(4) }
  end

  def create
    (0..3).each do |i|
      (0..3).each do |j|
        @board[i][j] = data[4 * i + j]
      end
    end
    @board
  end
end
