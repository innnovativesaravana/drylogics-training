class Board
  def initialize
    # @cells = [
    #   [Cell.new, Cell.new, Cell.new],
    #   [Cell.new, Cell.new, Cell.new],
    #   [Cell.new, Cell.new, Cell.new]
    # ]
    @cells = [['*', '*', '*'], ['*', '*', '*'], ['*', '*', '*']]
  end

  def display
    row_separator = ['-', '-', '-'].join("+")
    @cells.each_with_index { |cells, row_index|
      puts cells.join("|")
      puts row_separator if row_index < 2
    }
  end
end


Board.new.display()