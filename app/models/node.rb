class Node
  attr_accessor :children, :x, :y, :parent, :value, :ancestors

  def initialize(parent = nil, x = nil, y = nil, value = "")
    @children = []
    @x = x || parent.x
    @y = y || parent.y
    @value = value
    @parent = parent
    build_ancestors
  end

  def position
    [x, y]
  end

  def add_child(node)
    @children << node
  end

  def delete_node(position)
    @children.delete_if { |child| child.position == position }
  end

  private

  def build_ancestors
    @ancestors = []
    temp_parent = parent
    until temp_parent.nil?
      @ancestors << temp_parent.position
      temp_parent = temp_parent.parent
    end
  end
end
