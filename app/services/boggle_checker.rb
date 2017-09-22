require 'boggle_dictionary'

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

    @word_buffer = ""
    build_start_indexes
  end

  def call
    return response unless BoggleDictionary.exists?(query.downcase)
    start_searching_word_in_board
    store_found_word_if_any
    response
  end

  def start_searching_word_in_board
    start_indexes.each do |position|
      first_value = @board[position[0]][position[1]]
      @root_node = Node.new(nil, position[0], position[1], first_value)

      next unless find_possible_word(0, @root_node)
      response[:exist] = true

      return response
    end
  end

  def find_possible_word(query_index, node)
    return false if node.nil?
    if query_index >= query.size
      return true if BoggleDictionary.exists?(node.value.downcase) && node.value == query
      continue_searching(query_index, node)
    else
      x, y         = node.position
      current_char = query[query_index]

      if current_char == @board[x][y] || board[x][y] == "*"
        neighbors_of(x, y).each do |neighbor|
          next unless node.position != neighbor && !node.ancestors.include?(neighbor)
          child_value = @board[neighbor[0]][neighbor[1]] == "*" ? query[query_index + 1] : @board[neighbor[0]][neighbor[1]]
          value = node.value + child_value.to_s
          node.add_child(Node.new(node, neighbor[0], neighbor[1], value))
        end

        find_possible_word(query_index + 1, node.children.first)
      else
        continue_searching(query_index, node)
      end
    end
  end

  private

  def continue_searching(query_index, node)
    parent = node.parent
    return false if parent.nil?
    parent.delete_node(node.position)

    if parent.children.empty?
      find_possible_word(query_index, parent)
    else
      find_possible_word(query_index, parent.children.first)
    end
  end

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

  def store_found_word_if_any
    StoreFoundWord.call(boggle, response)
  end
end
