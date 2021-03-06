class Player
  include Interface

  attr_reader :char, :name, :inputs
  attr_writer :name, :inputs

  def initialize(name, char)
    # @name = %w[player1 player2].include?(name) ? get_input('name', name) : name
    @name = get_input('name', name)
    @inputs = []
    @char = char
  end

  def move(input)
    @inputs << input
  end
end
