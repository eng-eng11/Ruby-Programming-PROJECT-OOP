# frozen_string_literal: true

require './lib/interface'

class Board
  WIN_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
               [1, 4, 7], [2, 5, 8], [3, 6, 9],
               [1, 5, 9], [3, 5, 7]].freeze

  include Interface
  attr_accessor :positions

  def initialize
    @positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def update(input, char)
    @positions[input - 1] = char
    show(@positions)
  end

  def full?
    @positions.all? { |x| x.instance_of?(String) }
  end

  def win?(inputs)
    WIN_LINES.any? { |x| x - inputs == [] }
  end

  def taken?(input, positions = @positions)
    positions[input - 1].is_a? String
  end
end
