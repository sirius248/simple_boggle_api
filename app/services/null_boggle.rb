class NullBoggle
  def initialize
  end

  def board
    board = Array.new(4) { Array.new(4) }
    (0..3).each do |i|
      (0..3).each do |j|
        board[i][j] = ('a'..'z').to_a.sample
      end
    end
    board
  end
end
