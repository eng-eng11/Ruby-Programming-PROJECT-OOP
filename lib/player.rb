class Player
  include Interface

  attr_reader :char
  attr_accessor :name, :inputs

  def initialize(name, char)
    @name = get_input('name', name)
    @inputs = []
    @char = char
  end

  def move(input)
    @inputs << input
  end

end
