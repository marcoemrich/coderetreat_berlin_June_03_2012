require "rspec"
require "../cell"
require "../board"

describe LiveCell do

  before(:each) { @cell = LiveCell.new }

  it 'should die if lonely' do
    @cell.stub(num_neighbours: 0)
    new_cell = @cell.tick
    new_cell.should be_a DeadCell
  end

  it 'should stay alive with two neighbours' do
    @cell.stub(num_neighbours: 2)
    new_cell = @cell.tick
    new_cell.should be_a LiveCell
  end

end

describe DeadCell do

  before(:each) { @cell = DeadCell.new }

  it 'should be born if surrounded by three' do
    @cell.stub(num_neighbours: 3)
    new_cell = @cell.tick
    new_cell.should be_a LiveCell
  end

  it 'should stay dead if surrounded by four' do
    @cell.stub(num_neighbours: 4)
    new_cell = @cell.tick
    new_cell.should be_a DeadCell
  end

end

describe Board do

  before(:each) { @board = Board.new }

  it 'should have a list of living cells' do
    @board.living_cells.should be_a Set
    @board.living_cells.should be_empty
  end

  it 'should add a cell on #<<' do
    @board << [3, 4]
    @board[3, 4].should be_a LiveCell
  end
end