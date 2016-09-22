require_relative 'bin/position'
index_hash = {
  Position.new(0, 0) => 0,
  Position.new(0, 1) => 1,
  Position.new(0, 2) => 2,
  Position.new(1, 0) => 3,
  Position.new(1, 1) => 4,
  Position.new(1, 2) => 5,
  Position.new(2, 0) => 6,
  Position.new(2, 1) => 7,
  Position.new(2, 2) => 8
}

position = Position.new(1, 2)

p index_hash.key? position