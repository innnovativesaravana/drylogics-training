require 'byebug'

class EmptyCell
  def empty?() true; end
  def token() "*"; end
end
class OccupiedCell
  def initialize(token) @token = token; end
  def empty?() false; end
  attr_reader :token
end

class TicTacToe
  @@EMPTY = EmptyCell.new


  def initialize(size)
    # @cells = [
    #   [empty, empty, empty], 
    #   [empty, empty, empty], 
    #   [empty, empty, empty], 
    #   [empty, empty, empty]
    # ]
    @cells = Array.new(size){Array.new(size)}
    @size = size
    temp(size)
    @tokens = ['X', '0']
    @event_hash = Hash.new
    @count = [ ]
    @have = 0
    @win = false
  end

  def tokens() @tokens end

  def each_cell(&block)
    cells.each(&block)
  end

  def place!(position, token)
    raise 'Invalid token' unless tokens.include? token
    raise 'Your turn is over' if @last_played_token == token
    raise 'Token already placed.' unless cell_at(position).empty?

    self[position] = OccupiedCell.new(token)
    @have += 1
    @last_played_token = token

    if win?(position) and @event_hash[:win]
      @event_hash[:win].call(token)
    end
    @win = win?(position)
    if draw? and @event_hash[:draw]
      @event_hash[:draw].call(token)
    end
    # # @event_hash[event_name].call(token)
  end

  def token_at(position)
    cell_at(position).token
  end

  def win?(position)
  x = position.x
  y = position.y
  max_index = @size - 1
  # token_value = cell_value(x,y)
  one = row?(x, y, max_index)
  two = column?(x, y, max_index)
  thr = diagonal?(x, y, max_index)
  if one or two or thr
    return true
  else
    return false
  end
end

def row?(x, y, max_index)
  one = row_right(x, y, max_index)
  tem = row_left(x, y, max_index)
  return true if one or tem
end
def column?(x, y, max_index)
  one = column_up(x, y, max_index)
  tem = column_down(x, y, max_index)
  return true if one or tem
  return true if tem
end

def diagonal?(x, y, max_index)
  one = diagonal_right_up(x, y, max_index)
  tem = diagonal_right_down(x, y, max_index)
  c = diagonal_left_up(x, y, max_index)
  d = diagonal_left_down(x, y, max_index)
  return true if one or tem or c or d
end

def row_right(x, y, max_index)
  initial_value = y
  token_v = cell_value(x, initial_value)
  token_value = token_v.token
  won = false
  (max_index - 1).times { |i|
    y = y + 1
    tem = y
    if y > max_index
      tem = initial_value - (y - max_index)
    end
    temp_2_v = cell_value(x, tem)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

def row_left(x, y, max_index)
  initial_value = y
  token_v = cell_value(x, initial_value)
  token_value = token_v.token
  won = false
  (max_index - 1).times { |i|
    y = y - 1
    tem = y
    if y < 0
      tem = initial_value - y
    end
    temp_2_v = cell_value(x, tem)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else 
      won = false
      break
    end
  }
  return won
end

def column_down(x, y, max_index)
  initial_value = x
  token_v = cell_value(initial_value, y)
  token_value = token_v.token
  won = false
  (max_index - 1).times { |i|
    x = x + 1
    a = x
    if x > max_index
      a = initial_value - (x - max_index)
    end
    temp_2_v = cell_value(a, y)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

def column_up(x, y, max_index)
  initial_value = x
  token_v = cell_value(initial_value, y)
  token_value = token_v.token
  won = false
  (max_index - 1).times { |i|
    x = x - 1
    a = x
    if x < 0
      a = initial_value - x
    end
    temp_2_v = cell_value(a, y)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

def diagonal_right_down(x, y, max_index)
  initial_value_x = x
  initial_value_y = y
  token_v = cell_value(initial_value_x, initial_value_y)
  token_value = token_v.token
  won = false
  if x > y
    return false if (x - y) > 1
  elsif x < y
    return false if (y - x) > 1
  end
  (max_index - 1).times { |i|
    x = x + 1
    y = y + 1
    a = x
    b = y
    if x > max_index or y > max_index
      if x > max_index and y > max_index
        a = initial_value_x - (x - max_index)
        b = initial_value_y - (y - max_index)
      elsif x < max_index and y > max_index
        a = initial_value_x - (y - max_index)
        b = initial_value_y - (y - max_index)
      else
        a = initial_value_x - (x - max_index)
        b = initial_value_y - (x - max_index)
      end
    end
    temp_2_v = cell_value(a, b)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

def diagonal_left_up(x, y, max_index)
  initial_value_x = x
  initial_value_y = y
  token_v = cell_value(initial_value_x, initial_value_y)
  token_value = token_v.token
  won = false
  if x > y
    return false if (x - y) > 1
  elsif x < y
    return false if (y - x) > 1
  end
  (max_index - 1).times { |i| 
    x = x - 1
    y = y - 1
    a = x
    b = y
    if x < 0 or y < 0
      if x < 0 and y < 0
        a = initial_value_x - x
        b = initial_value_y - y
      elsif x > 0 and y < 0
        a = initial_value_x - y
        b = initial_value_y - y
      else
        a = initial_value_x - x
        b = initial_value_y - x
      end
    end
    temp_2_v = cell_value(a, b)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

def diagonal_right_up(x, y, max_index)
  initial_value_x = x
  initial_value_y = y
  token_v = cell_value(initial_value_x, initial_value_y)
  token_value = token_v.token
  won = false
  if (x + y) < (max_index - 1)
    return false
  elsif (x + y) > (max_index + 1)
    return false
  end
  (max_index - 1).times { |i|
    x = x - 1
    y = y + 1
    a = x
    b = y
    if x < 0 or y > max_index
      if x < 0 and y > max_index
        a = initial_value_x - x
        b = initial_value_y - (y - max_index)
      elsif x >= 0 and y > max_index
        a = initial_value_x + (y - max_index)
        b = initial_value_y - (y - max_index)
      else
        a = initial_value_x - x
        b = initial_value_y + x
      end
    end
    temp_2_v = cell_value(a, b)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

def diagonal_left_down(x, y, max_index)
  initial_value_x = x
  initial_value_y = y
  token_v = cell_value(initial_value_x, initial_value_y)
  token_value = token_v.token
  won = false
  if (x + y) < (max_index - 1)
    return false
  elsif (x + y) > (max_index + 1)
    return false
  end
  (max_index - 1).times { |i|
    x = x + 1
    y = y - 1
    a = x
    b = y
    if x > max_index or y < 0
      if x > max_index and y < 0
        a = initial_value_x - (x - max_index)
        b = initial_value_y - y
      elsif x > max_index and y >= 0
        a = initial_value_x - (x - max_index)
        b = initial_value_y + (x - max_index)
      else
        a = initial_value_x + y
        b = initial_value_y - y
      end
    end
    temp_2_v = cell_value(a, b)
    temp_2 = temp_2_v.token
    if temp_2 == token_value
      won = true
    else
      won = false
      break
    end
  }
  return won
end

  def draw?
    if @win == false and @have == 16
      true
    else
      false
    end
  end

  def register_listener(event_name, &block)
    @event_hash[event_name] = block
  end

  # def terminate(&block)
  #   @cells.each(&block)
  # end

  def empty_cell!(value)
    cells.each{|i|
      cells[i] = empty
    }
  end


  # def row_equal!(position)
  #   raise 'the game is over' unless (@cells[3] == @cells[4] and @cells[4] == @cells[5])
  # end

  # def column_equal!(position)
  #   raise 'the game is over' unless (@cells[0] == @cells[3] and @cells[3] == @cells[6])
  # end

  def current_player(token)
    i = @count.length 
    if i == 0
      @count[i] = token
      return true
    else
      if @count[i - 1] == token
        return false
      else
        return true
      end
    end
  end

  
    
  private
  def index(position)
    4 * position.x + position.y
  end

  def cell_at(position)
    @cells[position.x][position.y]
  end

  def cells
    @cells 
  end

  def cell(index)
    a = index/3
    b = index % 3
    @cells[a][b]
  end

  def cell_value(x, y)
    @cells[x][y]
  end
  def temp(size)
    size.times{ |i|
      size.times{ |j|
        @cells[i][j] = empty
      }
    }
  end
  
  def []=(position, cell_value)
    @cells[position.x][position.y] = cell_value
  end

  def empty() @@EMPTY; end

end