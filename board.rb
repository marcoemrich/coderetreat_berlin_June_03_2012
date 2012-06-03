class Board

  attr_reader :living_cells

  def initialize
    @living_cells = Set.new
  end

  def <<(pos)
    @living_cells << pos
  end

  def [](x,y)
    (@living_cells.include?([x,y]) && LiveCell.new) || DeadCell.new
  end

end