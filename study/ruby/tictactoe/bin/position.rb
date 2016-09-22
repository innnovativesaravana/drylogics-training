class Position
  def initialize(x, y)
    @x = x
    @y = y
  end

  attr_reader :x, :y
  alias_method :eql?, :==

  def ==(o)
    o.class == self.class && o.state == state
  end

  def hash
    13 * state.hash
  end


  protected 
  def state
    [@x, @y]
  end

end