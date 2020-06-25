require_relative "board.rb"
require_relative "knight.rb"

class Game
  attr_reader :board, :knight
  def initialize
    @board = Board.new(8)
    @knight = Knight.new
  end
  
  def knight_moves(departure, destination)
    knight.position = departure
    knights_path = board.build_knights_path(departure, destination, [knight])
    puts "You made it in #{knights_path.length} moves!  Here's your paths:"
    knights_path.each { |move| p move }
  end
end

game = Game.new

game.knight_moves([3, 3], [0, 0])






