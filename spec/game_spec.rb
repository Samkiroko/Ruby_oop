require 'rspec'
require_relative '../lib/interface.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

RSpec.describe Game do
  describe '#game_finish?' do
    it 'return true when board is full' do
      player1 = double('Player')
      player2 = double('Player')
      board = double('Board')
      game = Game.new(player1, player2, board)
      allow(board).to receive(:win?) { false }
      allow(board).to receive(:draw?) { true }
      expect(game.send(:game_finish?)).to be true
    end
  end
end
