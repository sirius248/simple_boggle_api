class BoggleChecker
  def self.call(boggle:, query:)
    new(boggle, query).call
  end

  attr_reader :boggle, :board, :query, :response, :word_buffer, :start_indexes

  def initialize(boggle, query)
    @boggle   = boggle
    @board    = boggle.board
    @query    = query.upcase
    @response = {
      exist: false,
      query: query
    }

    @word_buffer     = ""
    @visited_indexes = []
    build_start_indexes
  end

  def call
    return response unless BoggleDictionary.exists?(query.downcase)
    start_searching_word_in_board
    response
  end

  def start_searching_word_in_board
    start_indexes.each do |start_position|
      @visited_indexes = []
      @queue = [start_position]
      @word_buffer = ""

      if find_possible_word?(0)
        response[:exist] = true
        response[:start_position] = start_position

        return response
      end
    end
  end

  def find_possible_word?(query_index)
    if query_index >= query.size
      return @word_buffer.size >= 3 && BoggleDictionary.exists?(@word_buffer.downcase)
    else
      x, y = @queue.last
      current_char = query[query_index]

      if (current_char == @board[x][y] || board[x][y] == "*") && !@visited_indexes.include?(@queue.last)
        @word_buffer << current_char
        @visited_indexes << [x, y]
        @queue.pop

        neighbors_of(x, y).each { |neighbor| @queue = [neighbor] + @queue if !@visited_indexes.include?(neighbor) }

        find_possible_word?(query_index + 1)
      else
        @queue.pop
        return false if @queue.size == 0
        find_possible_word?(query_index)
      end
    end
  end

  private

  def neighbors_of(i, j)
    neighbors = []
    xs = [-1, -1, -1, 0, 0, 1, 1, 1]
    ys = [-1, 0, 1, -1, 1, -1, 0, 1]
    (0...8).each do |index|
      x = i + xs[index]
      y = j + ys[index]
      neighbors << [x, y] unless x < 0 || x > 3 || y < 0 || y > 3
    end
    neighbors
  end

  def build_start_indexes
    @start_indexes = []
    (0..3).each do |i|
      (0..3).each do |j|
        @start_indexes << [i, j] if @board[i][j] == query[0]
      end
    end
  end
end
