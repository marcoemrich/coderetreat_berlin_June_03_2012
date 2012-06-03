class Cell
  def tick
    follow_states[num_neighbours].new
  end
end

class LiveCell < Cell
  def follow_states
    Hash.new(DeadCell).merge(2 => LiveCell, 3 => LiveCell)
  end
end

class DeadCell < Cell
  def follow_states
    Hash.new(DeadCell).merge(3 => LiveCell)
  end
end