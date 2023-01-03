class Tree
  attr_accessor :root
  def initialize(knight_position)
    @root = Node.new(knight_position)
  end

  def print_tree(node = @root)
    puts "Position: #{node.position}"
    puts "Children: "
    node.children.each do |child|
      print "\n"
      print_tree(child)
    end
  end
end

class Node
  attr_accessor :children, :position, :from
  def initialize(position, from = nil)
    @position = position
    @from = from
    @children = []
  end
end
