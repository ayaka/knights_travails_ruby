class Square
  attr_accessor :coordinates, :up, :right, :down, :left
  def initialize(x, y)
    @coordinates = [x, y]
    @up = nil
    @right = nil
    @down = nil
    @left = nil
  end
end