class Knight
  attr_accessor :position, :parent, :moves

  def initialize 
    @position = nil
    @parent = nil
    @moves = []
  end

  def link_moves (current)
    all_moves = find_all_moves(current)
    all_moves.each do |move|
      moves << move.coordinates if move
    end
  end

  def find_all_moves(current, all_moves = [])
    all_moves << current.up&.up&.left
    all_moves << current.up&.up&.right
    all_moves << current.right&.right&.up
    all_moves << current.right&.right&.down
    all_moves << current.down&.down&.right
    all_moves << current.down&.down&.left
    all_moves << current.left&.left&.down
    all_moves << current.left&.left&.up
  end
end