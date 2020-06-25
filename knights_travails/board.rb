require_relative "square.rb"

class Board
  attr_reader :grid, :n
  def initialize(n)
    @grid = build_board(n)
    @n = n
    link_squares(n)
  end

  def build_knights_path (departure, destination, queue, visited = [])
    current = queue.shift
    if current.position == destination
      return backtrack_knights_path(departure, current)
    end
    current.link_moves(square(current.position[0], current.position[1]))
    current.moves.each do |move|
      child = Knight.new 
      child.position = move
      child.parent = current
      queue << child unless visited.include?(move)
    end
    visited << current.position
    build_knights_path(departure, destination, queue, visited)
  end

  private

  def build_board(n)
    Array.new(n) { |y| Array.new(n) { |x| Square.new(x, n - 1 - y) } }
  end

  def off_board?(x)
    x >= n || x < 0 
  end

  def square(x, y)
    grid[n - y - 1][x]
  end

  def link_squares(n)
    0.upto(n - 1) do |y|
      0.upto(n - 1) do |x|
        square = square(x, y)
        square.up = square(x, y + 1) unless off_board?(y + 1) 
        square.right = square(x + 1, y) unless off_board?(x + 1)
        square.down = square(x, y - 1) unless off_board?(y - 1)
        square.left = square(x - 1, y) unless off_board?(x - 1)
      end
    end
  end

  def backtrack_knights_path(departure, current, path = [])
    until current.position == departure
      path.unshift(current.position)
      current = current.parent
    end
    path.unshift(current.position)
  end

end




