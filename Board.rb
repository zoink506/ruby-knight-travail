require './Tree.rb'

class Board
  def initialize
    @board = build_board()
  end

  def build_board
    board = Array.new(8) { Array.new(8) }
  end

  def print_board(path)
    new_board = Array.new(8) { Array.new(8) }
    path.each_with_index do |pos, i|
      new_board[pos[0]][pos[1]] = i + 1
    end

    new_board.each do |row|
      print "|"
      row.each do |cell|
        if cell.nil?
          print "     |"
        else
          print "  #{cell}  |"
        end
      end
      print "\n"
    end
  end

  def knight_moves(start, target)

    moves_tree = Tree.new(start)

    queue = [moves_tree.root]
    v_offset = 2
    h_offset = 1

    while !queue.empty?
      current_node = queue.shift
      #p current_node.position
      #p current_node
      #p queue

      if current_node.position == target
        # Target has been found
        # Follow the back to the root using the from attributes
        puts "TARGET FOUND"

        path = []
        while current_node != @root
          path << current_node.position
          current_node = current_node.from
        end

        path.reverse.each_with_index do |pos, i| 
          if i < path.length-1
            print "#{pos} -> " 
          else
            print "#{pos}"
          end
        end
        print "\n"
        print_board(path.reverse)

        break
      end

      row = current_node.position[0]
      column = current_node.position[1]
      children = []

      children << Node.new([row - v_offset, column + h_offset], current_node) if !out_of_bounds?([row - v_offset, column + h_offset])
      children << Node.new([row - v_offset, column - h_offset], current_node) if !out_of_bounds?([row - v_offset, column - h_offset])
      children << Node.new([row + v_offset, column + h_offset], current_node) if !out_of_bounds?([row + v_offset, column + h_offset])
      children << Node.new([row + v_offset, column - h_offset], current_node) if !out_of_bounds?([row + v_offset, column - h_offset])
      children << Node.new([row - h_offset, column + v_offset], current_node) if !out_of_bounds?([row - h_offset, column + v_offset])
      children << Node.new([row + h_offset, column + v_offset], current_node) if !out_of_bounds?([row + h_offset, column + v_offset])
      children << Node.new([row - h_offset, column - v_offset], current_node) if !out_of_bounds?([row - h_offset, column - v_offset])
      children << Node.new([row + h_offset, column - v_offset], current_node) if !out_of_bounds?([row + h_offset, column - v_offset])

      #p children.map { |child| child.position }
      children.each { |child| queue << child }

      #gets()


    end
  end

  def out_of_bounds?(index)
    # [0][0] -> [7][7]
    if (index[0] >= 0 && index[0] < @board.length) && ( index[1] >= 0 && index[1] < @board[index[0]].length )
      return false
    end

    true
  end
end
